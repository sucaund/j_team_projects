package com.oracle.hellong.model;

import java.util.List;

import lombok.Data;

@Data
public class SearchResults {
   private List<Board> boardResults;
   private List<Gym> gymResults;
   private List<GymBoard> gymBoardResults;
   private List<GymReview> gymReviewResults;
   
}