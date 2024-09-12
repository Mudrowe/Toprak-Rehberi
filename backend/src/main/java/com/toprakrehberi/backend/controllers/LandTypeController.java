package com.toprakrehberi.backend.controllers;

import com.toprakrehberi.backend.dtos.LandTypeDTO;
import com.toprakrehberi.backend.models.LandType;
import com.toprakrehberi.backend.services.LandTypeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/land_type")
public class LandTypeController {

    private final LandTypeService landTypeService;

    public LandTypeController(LandTypeService landTypeService) {
        this.landTypeService = landTypeService;
    }

    @GetMapping
    public ResponseEntity<List<LandTypeDTO>> getAllLandTypes() {
        List<LandType> landTypes = landTypeService.getAllLandTypes();
        List<LandTypeDTO> landTypeDTOs = landTypes.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(landTypeDTOs, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<LandTypeDTO> getLandTypeById(@PathVariable("id") int id) {
        LandType landType = landTypeService.getLandTypeById(id);
        if (landType != null) {
            return new ResponseEntity<>(convertToDTO(landType), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    private LandTypeDTO convertToDTO(LandType landType) {
        return new LandTypeDTO(
                landType.getId(),
                landType.getName(),
                landType.getImageUrl()
        );
    }
}
