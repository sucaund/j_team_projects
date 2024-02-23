package com.oracle.hellong.controller;

import java.util.List;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.sh.Paging;
import com.oracle.hellong.service.sh.SHService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequiredArgsConstructor
@Slf4j
public class SHController {
	private final SHService sh;
	

}
