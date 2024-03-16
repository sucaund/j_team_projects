package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class PointCharge { //포인트충전 point_charge
   private int m_number; //멤버번호 //pk //f nn
    private int charge_number; //충전번호 //pk nn
    private Date charge_date; //충전일자(등록일자) //nn
    private int charge_point; //충전포인트
    private String out_account; //출금계좌
    private String card_number; //카드번호
       
}