package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.services.LandService;
import com.toprakrehberi.backend.services.LandTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/land")
public class LandController {

    @Autowired
    private LandService landService;

    private LandDTO convertToDTO(Land land) {
        return new LandDTO(
                land.getId(),
                land.getUserId(),
                land.getName(),
                land.getNeighborhoodId(),
                land.getParcelNo(),
                land.getAdaNo(),
                land.getSize(),
                land.getLandTypeId()
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
        land.setSize(landDTO.getSize());
        land.setLandTypeId(landDTO.getLandTypeId());

        return land;
    }

    @GetMapping
    public ResponseEntity<List<LandDTO>> getAllLands() {
        List<Land> lands = landService.getAllLands();
        List<LandDTO> landDTOs = lands.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(landDTOs, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<LandDTO> getLandById(@PathVariable("id") long id) {
        Land land = landService.getLandById(id);
        if (land != null) {
            return new ResponseEntity<>(convertToDTO(land), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @GetMapping("/byName/{name}")
    public ResponseEntity<LandDTO> getLandByName(@PathVariable String name) {
        Land land = landService.getLandByName(name);
        if (land != null) {
            return new ResponseEntity<>(convertToDTO(land), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
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

        return new ResponseEntity<>(savedLandDTO, HttpStatus.CREATED);
    }
}
