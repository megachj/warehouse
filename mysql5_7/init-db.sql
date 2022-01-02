CREATE DATABASE realmysql;
USE realmysql;

-- ### 회사 DB 구조 ###
-- 부서
CREATE TABLE `departments`(
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  KEY `ux_deptname` (`dept_name`)
) ENGINE=InnoDB;

-- 직원
CREATE TABLE `employees`(
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M', 'F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`),
  KEY `ix_firstname` (`first_name`),
  KEY `ix_hiredate` (`hire_date`)
) ENGINE=InnoDB;

-- 봉급
CREATE TABLE `salaries`(
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `from_date`),
  KEY `ix_salary` (`salary`)
) ENGINE=InnoDB;

-- 부서 직원 연관 테이블
CREATE TABLE `dept_emp`(
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`dept_no`, `emp_no`),
  KEY `ix_fromdate` (`from_date`),
  KEY `ix_empno_fromdate` (`emp_no`, `from_date`)
) ENGINE=InnoDB;

-- 부서장
CREATE TABLE `dept_manager`(
  `dept_no` char(4) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`dept_no`, `emp_no`)
) ENGINE=InnoDB;

-- 직무 
CREATE TABLE `titles`(
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`, `from_date`, `title`),
  KEY `ix_todate` (`to_date`)
) ENGINE=InnoDB;

-- ### 기타 테이블 ###
CREATE TABLE `employee_name`(
  `emp_no` int(11) NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  PRIMARY KEY (`emp_no`),
  FULLTEXT KEY `fx_name` (`first_name`, `last_name`)
) ENGINE=MyISAM;

CREATE TABLE `tb_dual`(
  `fd1` tinyint(4) NOT NULL,
  PRIMARY KEY (`fd1`)
) ENGINE=InnoDB;

-- ### 데이터 초기화 ###
INSERT INTO `departments`(`dept_no`, `dept_name`) 
VALUES 
('d001', '재무팀'),
('d002', '인사팀'),
('d003', '마케팅팀'),
('d004', '사업팀'),
('d005', '개발팀');

INSERT INTO `employees`(`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) 
VALUES 
(1, '1984-01-01', '병건', '이', 'M', '2018-01-02'),
(2, '1985-02-01', '천', '통', 'F', '2018-01-02'),
(3, '1980-03-01', '착맨', '침', 'M', '2018-01-02'),
(4, '1979-04-01', '펄', '쭈', 'M', '2018-01-02'),
(5, '1990-05-01', '풍', '김', 'M', '2018-01-02');
