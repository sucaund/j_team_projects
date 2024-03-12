package com.oracle.hellong.model;
import java.util.Date;

import lombok.Data;

@Data
public class GSDetail { //체육관 상세서비스 g_s_detail
      private int g_id; //체육관id //pk //f //nn
       private int s_number;//서비스번호 //pk //f //nn
       
       // gs와 이름 겹쳐서 수정했음 (03.11)
       private int sd_number;//서비스상세 //pk //nn
       private int sd_price; //적용가격 //nn
       
       private String  s_startdate;//이용시작기간 //nn
       private String  s_enddate;//이용종료기간

       // 없앰 (03.11) - 굳이 필요없는 column이라 판단
//       private String s_matters;//특이사항
       
       private int s_isend;//만료구분
}