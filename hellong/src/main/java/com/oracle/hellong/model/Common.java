package com.oracle.hellong.model;

import lombok.Data;

@Data
public class Common { //공통테이블 common
   private int common_bcd; //대분류 ex.100 200 400 500
   private int common_mcd; //중분류 ex.10 20 30 
   private String common_content; //컨텐츠(설명) ex.자유글
}
