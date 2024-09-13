package com.toprakrehberi.backend.utils;

import com.toprakrehberi.backend.dtos.LandDTO;
import com.toprakrehberi.backend.dtos.LandTypeDTO;
import com.toprakrehberi.backend.dtos.UserDTO;
import com.toprakrehberi.backend.dtos.location.NeighborhoodDTO;
import com.toprakrehberi.backend.models.Land;
import com.toprakrehberi.backend.models.User;

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

}
