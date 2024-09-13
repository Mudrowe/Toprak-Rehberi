package com.toprakrehberi.backend.utils;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.dtos.LandTypeDTO;
import com.toprakrehberi.backend.dtos.ProductOptionDTO;
import com.toprakrehberi.backend.dtos.location.NeighborhoodDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.ProductOption;

public class ConverterUtil {
    public LandDTO convertLandToLandDTO(Land land) {
        return new LandDTO(
                land.getId(),
                land.getUser().getId(),
                land.getName(),
                new NeighborhoodDTO(land.getNeighborhood().getId(), land.getNeighborhood().getName()),
                land.getParcelNo(),
                land.getAdaNo(),
                land.getArea(),
                new LandTypeDTO(land.getLandType().getId(), land.getLandType().getName(), land.getLandType().getImageUrl())
        );
    }

    public ProductOptionDTO convertProductOptionToDTO(ProductOption productOption) {
        return new ProductOptionDTO(
                productOption.getId(),
                productOption.getName(),
                productOption.getPlantingDuration(),
                productOption.getImageUrl()
        );
    }

}
