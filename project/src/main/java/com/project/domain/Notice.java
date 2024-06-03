package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int nno;
    private String title;
    private String content;
    private String author;
    private int vcnt;
    private Date resdate;
    private String img1;
    private String img2;
}
