package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {
	private int fno;
	private String ftitle;
	private String fcontent;
	private Date resdate;
}
