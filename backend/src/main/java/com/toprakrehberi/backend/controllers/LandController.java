package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.services.LandService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/land")
public class LandController {

    private final LandService landService;

    public LandController(LandService landService) {
        this.landService = landService;
    }

    private LandDTO convertToDTO(Land land) {
        return new LandDTO(
                land.getId(),
                land.getUserId(),
                land.getName(),
                land.getNeighborhoodId(),
                land.getParcelNo(),
                land.getAdaNo(),
                land.getArea(),
                land.getLandType().getId(),
                land.getLandType().getName(),
                land.getLandType().getImageUrl()
        );
    }

    private Land convertToEntity(LandDTO landDTO) {
        Land land = new Land();
        land.setId(landDTO.getId());
        land.setUserId(landDTO.getUserId());
        land.setName(landDTO.getName());
        land.setNeighborhoodId(landDTO.getNeighborhoodId());
        land.setParcelNo(landDTO.getParcelNo());
        land.setAdaNo(landDTO.getAdaNo());
        land.setArea(landDTO.getArea());

        LandType landType = landService.getLandTypeById(landDTO.getLandTypeId());
        if (landType != null) {
            land.setLandType(landType);
        }

        return land;
    }

    @GetMapping
    public ResponseEntity<List<LandDTO>> getAllLands() {
        List<Land> lands = landService.getAllLands();
        List<LandDTO> landDTOs = lands.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(landDTOs);
    }

    @GetMapping("/byId/{id}")
    public ResponseEntity<LandDTO> getLandById(@PathVariable("id") long id) {
        Land land = landService.getLandById(id);
        if (land != null) {
            return ResponseEntity.ok(convertToDTO(land));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }


    @GetMapping("/byName/{name}")
    public ResponseEntity<LandDTO> getLandByName(@PathVariable String name) {
        Land land = landService.getLandByName(name);
        if (land != null) {
            return ResponseEntity.ok(convertToDTO(land));
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
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        return ResponseEntity.ok(landDTOs);
    }

    @PostMapping()
    public ResponseEntity<LandDTO> createLand(@RequestBody LandDTO landDTO) {
        System.out.println("Received LandDTO JSON: " + landDTO.toString());

        Land land = convertToEntity(landDTO);
        Land savedLand = landService.saveLand(land);

        LandDTO savedLandDTO = convertToDTO(savedLand);

        System.out.println("Saved LandDTO: " + savedLandDTO);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedLandDTO);
    }
}
