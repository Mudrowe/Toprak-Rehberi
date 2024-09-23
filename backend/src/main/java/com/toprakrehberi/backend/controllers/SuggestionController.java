package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.SuggestionProductDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.location.Neighborhood;
import com.toprakrehberi.backend.repositories.LandRepository;
import com.toprakrehberi.backend.services.SuggestionService;
import com.toprakrehberi.backend.services.location.NeighborhoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/suggestions")
public class SuggestionController {

    private final SuggestionService suggestionService;
    private final LandRepository landRepository;
    private final NeighborhoodService neighborhoodService;

    @Autowired
    public SuggestionController(SuggestionService suggestionService, LandRepository landRepository, NeighborhoodService neighborhoodService) {
        this.suggestionService = suggestionService;
        this.landRepository = landRepository;
        this.neighborhoodService = neighborhoodService;
    }

    @GetMapping("/{landId}")
    public ResponseEntity<List<SuggestionProductDTO>> getSuggestions(@PathVariable Long landId) {
        // Fetch neighboring land IDs
        List<Long> neighboringLandIds = getNeighboringLandIds(landId);

        // Fetch the suggestions from the service
        List<SuggestionProductDTO> suggestions = suggestionService.getSuggestions(neighboringLandIds);

        return ResponseEntity.ok(suggestions);
    }

    @GetMapping("/byNeighborhoodId/{neighborhoodId}")
    public ResponseEntity<List<SuggestionProductDTO>> getSuggestionsByNeighborhoodId(@PathVariable int neighborhoodId) {
        // Fetch all lands in the neighborhood
        List<Land> landsInNeighborhood = landRepository.findByNeighborhoodId(neighborhoodId);
        List<Long> landIds = landsInNeighborhood.stream().map(Land::getId).collect(Collectors.toList());

        // Fetch the suggestions from the service based on the lands in the neighborhood
        List<SuggestionProductDTO> suggestions = suggestionService.getSuggestions(landIds);

        return ResponseEntity.ok(suggestions);
    }


    private List<Long> getNeighboringLandIds(Long landId) {
        // Fetch the land by landId to get the neighborhood it belongs to
        Land currentLand = landRepository.findById(landId).orElse(null);

        // Fetch neighboring neighborhoods based on the current neighborhood's district
        List<Neighborhood> neighboringNeighborhoods = neighborhoodService.getNeighborhoodsByDistrictId(currentLand.getNeighborhood().getDistrict().getId());

        // Fetch lands in all neighboring neighborhoods
        return neighboringNeighborhoods.stream()
                .flatMap(neighborhood -> landRepository.findByNeighborhoodId(neighborhood.getId()).stream())
                .map(Land::getId)
                .collect(Collectors.toList());
    }
}
