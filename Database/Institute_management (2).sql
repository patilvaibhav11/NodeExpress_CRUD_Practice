-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 01, 2022 at 11:50 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Institute_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_area_master`
--

CREATE TABLE `tb_area_master` (
  `area_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1-Active, 0-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_area_master`
--

INSERT INTO `tb_area_master` (`area_id`, `city_id`, `area_name`, `status`) VALUES
(1, 1, 'Gangapur Road', 1),
(2, 1, 'Peth Road ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_branch_master`
--

CREATE TABLE `tb_branch_master` (
  `branch_id` int(11) NOT NULL,
  `Inst_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_phone_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_branch_master`
--

INSERT INTO `tb_branch_master` (`branch_id`, `Inst_id`, `area_id`, `branch_name`, `branch_phone_no`) VALUES
(1, 1, 1, 'Shinde classes Tech', '9090909090'),
(2, 1, 2, 'Shinde Classes Regular', '9090909090');

-- --------------------------------------------------------

--
-- Table structure for table `tb_city_master`
--

CREATE TABLE `tb_city_master` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1-Active, 0-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_city_master`
--

INSERT INTO `tb_city_master` (`city_id`, `city_name`, `status`) VALUES
(1, 'Nashik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_course_and_its_subjects`
--

CREATE TABLE `tb_course_and_its_subjects` (
  `cs_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_course_master`
--

CREATE TABLE `tb_course_master` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fees_master`
--

CREATE TABLE `tb_fees_master` (
  `fees_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `paid_fee` int(11) NOT NULL,
  `paid_date` datetime NOT NULL DEFAULT current_timestamp(),
  `remark` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_fees_master`
--

INSERT INTO `tb_fees_master` (`fees_id`, `student_id`, `subject_id`, `paid_fee`, `paid_date`, `remark`) VALUES
(1, 1, 0, 100, '2022-08-22 21:03:27', 'Registration fees'),
(2, 1, 0, 100, '2022-08-22 21:05:19', 'Registration fees'),
(3, 1, 0, 100, '2022-08-22 21:05:51', 'Registration fees');

-- --------------------------------------------------------

--
-- Table structure for table `tb_institute_master`
--

CREATE TABLE `tb_institute_master` (
  `inst_id` int(11) NOT NULL,
  `inst_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `inst_email` varchar(100) NOT NULL,
  `inst_phone_no` varchar(100) NOT NULL,
  `inst_main_address` varchar(100) NOT NULL,
  `inst_website_link` varchar(100) NOT NULL,
  `inst_founder` varchar(100) NOT NULL,
  `inst_foundation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_institute_master`
--

INSERT INTO `tb_institute_master` (`inst_id`, `inst_name`, `username`, `password`, `inst_email`, `inst_phone_no`, `inst_main_address`, `inst_website_link`, `inst_founder`, `inst_foundation_date`) VALUES
(1, 'Shinde Classes', 'vaibhav', '123', 'shinde@gmail.com', '909090909090', 'Peth Road, Nashik', 'shinde.com', 'Uttam Shinde', '1992-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_role_master`
--

CREATE TABLE `tb_role_master` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_role_master`
--

INSERT INTO `tb_role_master` (`role_id`, `role_name`, `description`) VALUES
(1, 'Teacher', 'Teacher'),
(2, 'Receptionist', 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `tb_staff_master`
--

CREATE TABLE `tb_staff_master` (
  `staff_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `staff_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_staff_master`
--

INSERT INTO `tb_staff_master` (`staff_id`, `branch_id`, `role_id`, `staff_name`) VALUES
(1, 1, 1, 'Dinesh'),
(2, 1, 1, 'Tanmay'),
(3, 1, 1, 'Aniket'),
(4, 1, 2, 'Vaibhav');

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_and_its_subject`
--

CREATE TABLE `tb_student_and_its_subject` (
  `ss_id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_master`
--

CREATE TABLE `tb_student_master` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `student_image` varchar(100) NOT NULL,
  `phone_no` varchar(100) NOT NULL,
  `parents_ph_no` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `brnach_id` int(11) NOT NULL,
  `is_register` tinyint(1) NOT NULL COMMENT '1-Active , 0-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_student_master`
--

INSERT INTO `tb_student_master` (`student_id`, `student_name`, `age`, `email`, `student_image`, `phone_no`, `parents_ph_no`, `birthdate`, `address`, `staff_id`, `brnach_id`, `is_register`) VALUES
(1, 'Vaibhav Ashok Patil', '22', 'vaibhav@gmail.com', 'nulll', '9096010022', '8989989899', '2000-12-11', 'Nashik', 1, 1, 1);

--
-- Triggers `tb_student_master`
--
DELIMITER $$
CREATE TRIGGER `afterRegister` AFTER UPDATE ON `tb_student_master` FOR EACH ROW INSERT INTO tb_fees_master(student_id, subject_id, paid_fee, remark) VALUES (new.student_id, 0 , 100, 'Registration fees')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_subject_master`
--

CREATE TABLE `tb_subject_master` (
  `sub_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `subject_fees` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_subject_master`
--

INSERT INTO `tb_subject_master` (`sub_id`, `subject_name`, `subject_fees`) VALUES
(0, 'Registration Fees', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_area_master`
--
ALTER TABLE `tb_area_master`
  ADD PRIMARY KEY (`area_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `tb_branch_master`
--
ALTER TABLE `tb_branch_master`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `Inst_id` (`Inst_id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indexes for table `tb_city_master`
--
ALTER TABLE `tb_city_master`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `tb_course_and_its_subjects`
--
ALTER TABLE `tb_course_and_its_subjects`
  ADD PRIMARY KEY (`cs_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `tb_course_master`
--
ALTER TABLE `tb_course_master`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tb_fees_master`
--
ALTER TABLE `tb_fees_master`
  ADD PRIMARY KEY (`fees_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `tb_institute_master`
--
ALTER TABLE `tb_institute_master`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indexes for table `tb_role_master`
--
ALTER TABLE `tb_role_master`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tb_staff_master`
--
ALTER TABLE `tb_staff_master`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tb_student_and_its_subject`
--
ALTER TABLE `tb_student_and_its_subject`
  ADD PRIMARY KEY (`ss_id`),
  ADD KEY `stud_id` (`stud_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `tb_student_master`
--
ALTER TABLE `tb_student_master`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tb_subject_master`
--
ALTER TABLE `tb_subject_master`
  ADD PRIMARY KEY (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_area_master`
--
ALTER TABLE `tb_area_master`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_branch_master`
--
ALTER TABLE `tb_branch_master`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_city_master`
--
ALTER TABLE `tb_city_master`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_course_and_its_subjects`
--
ALTER TABLE `tb_course_and_its_subjects`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_course_master`
--
ALTER TABLE `tb_course_master`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_fees_master`
--
ALTER TABLE `tb_fees_master`
  MODIFY `fees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_institute_master`
--
ALTER TABLE `tb_institute_master`
  MODIFY `inst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_role_master`
--
ALTER TABLE `tb_role_master`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_staff_master`
--
ALTER TABLE `tb_staff_master`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_student_and_its_subject`
--
ALTER TABLE `tb_student_and_its_subject`
  MODIFY `ss_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_student_master`
--
ALTER TABLE `tb_student_master`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_subject_master`
--
ALTER TABLE `tb_subject_master`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_area_master`
--
ALTER TABLE `tb_area_master`
  ADD CONSTRAINT `tb_area_master_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `tb_city_master` (`city_id`);

--
-- Constraints for table `tb_branch_master`
--
ALTER TABLE `tb_branch_master`
  ADD CONSTRAINT `tb_branch_master_ibfk_1` FOREIGN KEY (`Inst_id`) REFERENCES `tb_institute_master` (`inst_id`),
  ADD CONSTRAINT `tb_branch_master_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `tb_area_master` (`area_id`);

--
-- Constraints for table `tb_course_and_its_subjects`
--
ALTER TABLE `tb_course_and_its_subjects`
  ADD CONSTRAINT `tb_course_and_its_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `tb_subject_master` (`sub_id`),
  ADD CONSTRAINT `tb_course_and_its_subjects_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `tb_course_master` (`course_id`);

--
-- Constraints for table `tb_fees_master`
--
ALTER TABLE `tb_fees_master`
  ADD CONSTRAINT `tb_fees_master_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tb_student_master` (`student_id`),
  ADD CONSTRAINT `tb_fees_master_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `tb_subject_master` (`sub_id`);

--
-- Constraints for table `tb_staff_master`
--
ALTER TABLE `tb_staff_master`
  ADD CONSTRAINT `tb_staff_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role_master` (`role_id`),
  ADD CONSTRAINT `tb_staff_master_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `tb_branch_master` (`branch_id`);

--
-- Constraints for table `tb_student_and_its_subject`
--
ALTER TABLE `tb_student_and_its_subject`
  ADD CONSTRAINT `tb_student_and_its_subject_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `tb_student_master` (`student_id`),
  ADD CONSTRAINT `tb_student_and_its_subject_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `tb_subject_master` (`sub_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
