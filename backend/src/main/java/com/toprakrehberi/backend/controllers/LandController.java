package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.services.LandService;
import com.toprakrehberi.backend.services.LandTypeService;
import com.toprakrehberi.backend.services.location.NeighborhoodService;
import com.toprakrehberi.backend.services.UserService;
import com.toprakrehberi.backend.utils.ConverterUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/land")
public class LandController {

    private final LandService landService;
    private final LandTypeService landTypeService;
    private final NeighborhoodService neighborhoodService;
    private final UserService userService;

    public LandController(LandService landService, LandTypeService landTypeService, NeighborhoodService neighborhoodService, UserService userService) {
        this.landService = landService;
        this.landTypeService = landTypeService;
        this.neighborhoodService = neighborhoodService;
        this.userService = userService;
    }

    @GetMapping
    public ResponseEntity<List<LandDTO>> getAllLands() {
        List<Land> lands = landService.getAllLands();
        List<LandDTO> landDTOs = lands.stream()
                .map(ConverterUtil::convertToLandDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(landDTOs);
    }

    @GetMapping("/byId/{id}")
    public ResponseEntity<LandDTO> getLandById(@PathVariable("id") long id) {
        Land land = landService.getLandById(id);
        if (land != null) {
            return ResponseEntity.ok(ConverterUtil.convertToLandDTO(land));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byName/{name}")
    public ResponseEntity<LandDTO> getLandByName(@PathVariable String name) {
        Land land = landService.getLandByName(name);
        if (land != null) {
            return ResponseEntity.ok(ConverterUtil.convertToLandDTO(land));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/name/byId/{landId}")
    public ResponseEntity<String> getLandNameById(@PathVariable long landId) {
        Land land = landService.getLandById(landId);
        if (land != null) {
            return ResponseEntity.ok(land.getName());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/byUserId/{userId}")
    public ResponseEntity<List<LandDTO>> getLandsByUserId(@PathVariable Long userId) {
        List<Land> lands = landService.getLandsByUserId(userId);
        List<LandDTO> landDTOs = lands.stream()
                .map(ConverterUtil::convertToLandDTO)
                .collect(Collectors.toList());

        return ResponseEntity.ok(landDTOs);
    }

    @PostMapping()
    public ResponseEntity<LandDTO> createLand(@RequestBody LandDTO landDTO) {
        System.out.println("Received LandDTO JSON: " + landDTO.toString());

        Land land = ConverterUtil.convertToLandEntity(landDTO, userService, neighborhoodService, landTypeService);
        Land savedLand = landService.saveLand(land);

        LandDTO savedLandDTO = ConverterUtil.convertToLandDTO(savedLand);

        System.out.println("Saved LandDTO: " + savedLandDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedLandDTO);
    }
}
