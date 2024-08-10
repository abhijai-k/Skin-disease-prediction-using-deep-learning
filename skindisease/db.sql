/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - skincancer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skincancer` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `skincancer`;

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(122) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `image` */

insert  into `image`(`id`,`image`) values 
(2,'storage_emulated_0_Android_media_com.whatsapp_WhatsApp_Media_WhatsApp_Images_IMG-20230307-WA0008.jpg'),
(3,'storage_emulated_0_Android_media_com.whatsapp_WhatsApp_Media_WhatsApp_Images_IMG-20230306-WA0001.jpg');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `type` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`type`) values 
(1,'123','123','user');

/*Table structure for table `remedy` */

DROP TABLE IF EXISTS `remedy`;

CREATE TABLE `remedy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(300) DEFAULT NULL,
  `remedy` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `remedy` */

insert  into `remedy`(`id`,`disease`,`remedy`) values 
(1,'Acne and Rosacea Photos','Treatment for rosacea focuses on controlling signs and symptoms. Most often this requires a combination of good skin care and prescription drugs.'),
(2,'Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesions','Some of the other potential treatments for BCC are similar to those of actinic keratosis. These can include cryotherapy or topical treatment with 5-fluorouracil or imiquimod cream. In rare cases, BCC '),
(3,'Atopic Dermatitis Photos','emollients (moisturisers) – used every day to stop the skin becoming dry. topical corticosteroids – creams and ointments used to reduce swelling and redness during flare-ups.'),
(4,'Bullous Disease Photos','Topical corticosteroids, systemic corticosteroids, and doxycycline are the mainstays of initial treatment for bullous pemphigoid. Additional immunomodulatory therapies are often added to minimize the adverse effects of chronic corticosteroid therapy or to augment improvement in the disease.'),
(5,'Cellulitis Impetigo and other Bacterial Infections','Early treatment with antibiotics is usually successful. Most people receive treatment at home, but some need to receive it in a hospital.'),
(6,'Eczema Photos','Moisturize your skin at least twice a day'),
(7,'Exanthems and Drug Eruptions','Therapy for exanthematous drug eruptions is supportive in nature. First-generation antihistamines are used 24 h/d. Mild topical steroids (eg, hydrocortisone, desonide) and moisturizing lotions are also used, especially during the late desquamative phase'),
(8,'Hair Loss Photos Alopecia and other Hair Diseases','Minoxidil: Also known by the brand name Rogaine®, minoxidil can help you keep the hair growth stimulated by another treatment'),
(9,'Herpes HPV and other STDs Photos','Don\'t try to treat a sexually transmitted disease, or STD, yourself. These diseases are contagious and serious. You must see a doctor'),
(10,'Light Diseases and Disorders of Pigmentation','chemical peels,microdermabrasion,intense pulsed light (IPL)'),
(11,'Lupus and other Connective Tissue diseases','Corticosteroids. Drugs, such as prednisone (Deltasone, Rayos), can help prevent your immune system from attacking healthy cells and suppress inflammation.'),
(12,'Melanoma Skin Cancer Nevi and Moles','Treatment for early-stage melanomas usually includes surgery to remove the melanoma. A very thin melanoma may be removed entirely during the biopsy and require no further treatment. Otherwise, your surgeon will remove the cancer as well as a border of normal skin and a layer of tissue beneath the skin'),
(13,'Nail Fungus and other Nail Disease','Try nonprescription antifungal nail creams and ointments. Several products are available, such as terbinafine (Lamisil). ...'),
(14,'Poison Ivy Photos and other Contact Dermatitis','Apply an over-the-counter cortisone cream or ointment (Cortizone 10) for the first few days. Apply calamine lotion or creams containing menthol. Take oral antihistamines, such as diphenhydramine (Benadryl), which may also help you sleep better.'),
(15,'Psoriasis pictures Lichen Planus and related diseases','The first choice for treatment of lichen planus is usually a prescription corticosteroid cream or ointment. If that doesn\'t help and your condition is severe or widespread, your doctor might suggest a corticosteroid pill or injection'),
(16,'Scabies Lyme Disease and other Infestations and Bites','Permethrin is the drug of choice for the treatment of scabies. Topical permethrin should be administered every 2-3 days for 1-2 weeks to treat crusted scabies. Benzyl benzoate 25% (with or without tea tree oil) Benzyl benzoate may be used as an alternative topical agent to permethrin'),
(17,'Seborrheic Keratoses and other Benign Tumors','Freezing a growth with liquid nitrogen (cryotherapy) can be an effective way to remove a seborrheic keratosis. It doesn\'t always work on raised, thicker growths. This method carries the risk of permanent loss of pigment, especially on Black or brown skin. Scraping (curettage) or shaving the skin\'s surface'),
(18,'Systemic Disease','The FDA has recently approved a topical solution of 40% hydrogen peroxide to treat seborrheic keratosis. (Over-the-counter hydrogen peroxide is a 1% solution.)'),
(19,'Tinea Ringworm Candidiasis and other Fungal Infections','Ringworm on the skin like athlete\'s foot (tinea pedis) and jock itch (tinea cruris) can usually be treated with non-prescription antifungal creams, lotions, or powders applied to the skin for 2 to 4 weeks. There are many non-prescription products available to treat ringworm, including: Clotrimazole (Lotrimin, Mycelex)'),
(20,'Urticaria Hives','If the itchiness is causing you discomfort, antihistamines can help. Antihistamines are available over the counter at pharmacies – speak to your pharmacist for advice. A short course of steroid tablets (oral corticosteroids) may occasionally be needed for more severe cases of urticaria.'),
(21,'Vascular Tumors','Propranolol is also used to treat benign vascular tumor of liver and kaposiform hemangioendothelioma. Other beta-blockers used to treat vascular tumors include atenolol, nadolol, and timolol. Infantile hemangioma may also be treated with propranolol and steroid therapy or propranolol and topical beta-blocker therapy.'),
(22,'Vasculitis Photos','A corticosteroid drug, such as prednisone, is the most common type of drug prescribed to control the inflammation associated with vasculitis. Side effects of corticosteroids can be severe, especially if you take them for a long time'),
(23,'Warts Molluscum and other Viral Infections','Physical removal of lesions may include cryotherapy (freezing the lesion with liquid nitrogen), curettage (the piercing of the core and scraping of caseous or cheesy material), and laser therapy');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
