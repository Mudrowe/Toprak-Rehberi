package com.toprakrehberi.backend.utils;

import com.toprakrehberi.backend.dtos.*;
import com.toprakrehberi.backend.dtos.location.NeighborhoodDTO;
import com.toprakrehberi.backend.models.*;
import com.toprakrehberi.backend.models.location.Neighborhood;
import com.toprakrehberi.backend.services.LandTypeService;
import com.toprakrehberi.backend.services.UserService;
import com.toprakrehberi.backend.services.location.NeighborhoodService;

public class ConverterUtil {

    public static UserDTO convertToUserDTO(User user) {
        return new UserDTO(
                user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber()
        );
    }

    public static LandDTO convertToLandDTO(Land land) {
        return new LandDTO(
                land.getId(),
                land.getUser().getId(),
                land.getName(),
                new NeighborhoodDTO(
                        land.getNeighborhood().getId(),
                        land.getNeighborhood().getName(),
                        land.getNeighborhood().getDistrict().getId()
                ),
                land.getParcelNo(),
                land.getAdaNo(),
                land.getArea(),
                new LandTypeDTO(land.getLandType().getId(), land.getLandType().getName(), land.getLandType().getImageUrl())
        );
    }

    public static ProductOptionDTO convertToProductOptionDTO(ProductOption productOption) {
        return new ProductOptionDTO(
                productOption.getId(),
                productOption.getName(),
                productOption.getPlantingDuration(),
                productOption.getImageUrl()
        );
    }

    public static ProductDTO convertToProductDTO(Product product) {
        return new ProductDTO(
                product.getId(),
                product.getPlantingDate(),
                product.getHarvestDate(),
                convertToLandDTO(product.getLand()),
                product.getScore(),
                convertToProductOptionDTO(product.getProductOption()),
                product.getArea(),
                product.isHarvested()
        );
    }


    public static Land convertToLandEntity(LandDTO landDTO, UserService userService, NeighborhoodService neighborhoodService, LandTypeService landTypeService) {
        Land land = new Land();
        land.setId(landDTO.getId());
        land.setUser(userService.getUserById(landDTO.getUserId()));
        land.setName(landDTO.getName());

        Neighborhood neighborhood = neighborhoodService.getNeighborhoodById(landDTO.getNeighborhood().getId());
        if (neighborhood != null) {
            land.setNeighborhood(neighborhood);
        }

        LandType landType = landTypeService.getLandTypeById(landDTO.getLandType().getId());
        if (landType != null) {
            land.setLandType(landType);
        }

        land.setParcelNo(landDTO.getParcelNo());
        land.setAdaNo(landDTO.getAdaNo());
        land.setArea(landDTO.getArea());

        return land;
    }
}
