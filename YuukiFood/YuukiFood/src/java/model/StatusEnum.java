/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */

public enum StatusEnum {
    PENDING(1, "Wait"),
    SHIPPING(2, "Process"),
    DELIVERED(3, "Done"),
    CANCELED(4, "Canceled"),;

    public final Integer code;
    public final String name;

    StatusEnum(Integer code,
            String name
    ) {
        this.code = code;
        this.name = name;
    }

    public static StatusEnum findByCode(Integer code) {
        for (StatusEnum value : values()) {
            if (value.code.equals(code)) {
                return value;
            }
        }
        return StatusEnum.CANCELED;
    }
}
