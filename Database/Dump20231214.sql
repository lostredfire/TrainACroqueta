CREATE DATABASE  IF NOT EXISTS `trainacroquetadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `trainacroquetadb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.1.22    Database: trainacroquetadb
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exercisecroquetas`
--

DROP TABLE IF EXISTS `exercisecroquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisecroquetas` (
  `idGame` int(11) NOT NULL,
  `idExercise` int(11) NOT NULL AUTO_INCREMENT,
  `qttyCroquetas` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `dateTime` date DEFAULT NULL,
  PRIMARY KEY (`idExercise`),
  KEY `pkidgame_idx` (`idGame`),
  CONSTRAINT `pkidgame` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisecroquetas`
--

LOCK TABLES `exercisecroquetas` WRITE;
/*!40000 ALTER TABLE `exercisecroquetas` DISABLE KEYS */;
INSERT INTO `exercisecroquetas` VALUES (1,1,8,8,NULL),(2,2,300,80,'2020-03-09'),(2,3,NULL,NULL,'2020-03-09');
/*!40000 ALTER TABLE `exercisecroquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamedata`
--

DROP TABLE IF EXISTS `gamedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamedata` (
  `idGame` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `nCroquetas` int(11) DEFAULT 0,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`idGame`),
  KEY `pkidUser_idx` (`idUser`),
  CONSTRAINT `pkidUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamedata`
--

LOCK TABLES `gamedata` WRITE;
/*!40000 ALTER TABLE `gamedata` DISABLE KEYS */;
INSERT INTO `gamedata` VALUES (1,2,300,'2023-12-03'),(2,3,20,'2021-12-03'),(6,16,400,NULL),(7,24,0,NULL),(8,25,0,NULL);
/*!40000 ALTER TABLE `gamedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameproducer`
--

DROP TABLE IF EXISTS `gameproducer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameproducer` (
  `idGame` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  UNIQUE KEY `idProd_UNIQUE` (`idProd`),
  KEY `pkidgame2_idx` (`idGame`),
  KEY `pkidprod2_idx` (`idProd`),
  CONSTRAINT `pkidgame2` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidprod2` FOREIGN KEY (`idProd`) REFERENCES `producer` (`idProd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameproducer`
--

LOCK TABLES `gameproducer` WRITE;
/*!40000 ALTER TABLE `gameproducer` DISABLE KEYS */;
INSERT INTO `gameproducer` VALUES (1,1,30),(1,2,30),(1,3,40);
/*!40000 ALTER TABLE `gameproducer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameranking`
--

DROP TABLE IF EXISTS `gameranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameranking` (
  `idGame` int(11) NOT NULL,
  `idRanking` int(11) NOT NULL,
  `position` int(11) DEFAULT 0,
  `nCroquetas` int(11) DEFAULT 0,
  KEY `pkidgame4_idx` (`idGame`),
  KEY `pkidranking_idx` (`idRanking`),
  CONSTRAINT `pkidgame4` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidranking` FOREIGN KEY (`idRanking`) REFERENCES `ranking` (`idRanking`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameranking`
--

LOCK TABLES `gameranking` WRITE;
/*!40000 ALTER TABLE `gameranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamerewards`
--

DROP TABLE IF EXISTS `gamerewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamerewards` (
  `idGame` int(11) NOT NULL,
  `idRewards` int(11) NOT NULL,
  KEY `pkidgame3_idx` (`idGame`),
  KEY `pkidreward_idx` (`idRewards`),
  CONSTRAINT `pkidgame3` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidreward` FOREIGN KEY (`idRewards`) REFERENCES `rewards` (`idRewards`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamerewards`
--

LOCK TABLES `gamerewards` WRITE;
/*!40000 ALTER TABLE `gamerewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamerewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `idProd` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(45) DEFAULT NULL,
  `prodQuantity` int(11) DEFAULT NULL,
  `img` blob DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Cursor',1,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0‹\Ïg-\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0\0<tEXtComment\0xr:d:DAFkYFr2kIw:24,j:2064167642558949265,t:23061116:;N¶\0\0iTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>Panel de Botones - click</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-06-11</Attrib:Created>\n        <Attrib:ExtId>f191fe71-d423-41fb-9199-3941a6b8b176</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>–\â)\0\0IDATxœ\íyœE\Õ÷BØŸ°?€\ZhY\"[&\ìK \ê¾1hXTø¨ˆË‡\å­S\nA\Ê\Z$\nHb\";²/s {ış\ÑÕ™;—\î;sg\î:\Ó\ß\ævWõ\ís\ïünUW\Õ9§´ \Õo\n´”B€-¥`AK)X\ĞR\n´”B€-¥`AK)X\ĞR\n´”B€-¥`AK)X\ĞR\n´”B€-¥e\ÔZo\0`_f\ŞÀ—¬\à¿\0\Ä\0\ŞPğ3?\0`¶1\æ¥V\ÙZ\Ğ8š*@¥\Ô(fLDG\0Ø¦\Æ\Ë‘K˜ù2\ç\ÜüF\ØW\Ğ|š&@k\í‘D\Ä\0Öª(Z\à)\0¯\0˜`)\0«¬`dEıwE\ä\Ì|¶s\î\ß\r5º \á4\\€J©D¤Àe§\ç¸Š™¯‘{ss®]ˆ&0ó7\0Œ\Şb\\\à\Ï\ÌükcÌ¿\Zö\n\ZJCh­İ•ˆ®°Š?5_DNa\æœs\Ôò^Z\ëu‰\èDt$€•*Šg2óY\Æ[»šG\Ãh­=˜ˆ®DO«õ7\":\Ü9÷\ê`\ŞW)5š™\'¢X§¢øŸ\Ìük¹\Î9÷\é`\îS\Ğ\Z\"@k\íDt#€Q\0>‘“˜ùT\ç\\\İî¡”Zš™!¢\ã\0lVQü‚ˆœ\Ã\Ìt\Î}T·›ÔºPk½>3??¥\"\"“£(º¢\Ş÷IQJˆöf\æŸ\0 Š\â7D\ä\\9\ß3¯Q6œº\nP)5BDÀN\0 \"\ÇFQtv=\ïQ\r­õ\Ö\ÌüS\0\"M§|\0\àf>\Ó\Ó\İ,{\nú¦®´\Ö~›ˆş\èg\Ñ}u»J©‰h\0›0ó:\0V‘E\än¹\Ç9·¨V;´\Ö2ó±\0°|Y\Ñb\0\×ú‘óÃµ¾oAı©›\0•RË‰\ÈóH1ó&Æ˜Wª\ÔÁ\ÌG‘°rNµ·ü\äóY™óSJ­\Î\Ì\ß%¢c¬´”s;3O‘[\ëùlZPu µö‡Dt6\0ˆ\È/£(úyuµÖ›2s€­ûùöø“\ïBŸ¨\Õ6¥Ô²\Ìüm?r[Qü83Ÿ&\"W;\ç\×ú\Şƒ£nŒ\ãø1\0›xŸˆ\ÖÊ›\çSJ‘»¬v\0À<™&\"7x	É´Í—ı³Ü®o1“™\Ï0\Æ\ÜY«¾\Õ=Ğœ·«(~YD\Îb\æ\éµ\ÎQœºPkı?\Ìü?¼<‚\ÉYõ”RËŠÈƒ\06õ§şJDSsod\Ô]JD\îGâ¨\Å\Ì|ºˆ\ÌÈœŸ\Özgf>À~Eo‹È…\Ì|s\î?µ¾oAmŒ¨Ç›Ñ„ô53ÿ%¯3ÿ=â»‡ˆ\Ê\08\ç>0§\Êm·e\æ\ëD\äik\í‘J©ej±\Ùsg™yS\0H—W!¢Ÿ‹Hw\Çj­7©\å}j£^L»³À½Yu”R£‰\è\Ç\é13Ou\Î}œ÷J©\r‘L§ô\Å\ÆDô{™k­=^)µZß—ô`Œy*‚\ï0ó\"r\Z‡\0XÀ\ÌüT\Ç\×k­\Ç\×ò¾ı£.]p\Ç\Ï\ØÀ³A|>«\Öúfş“?œÁ¶u6#¢½‰hW\0\ÛXa\0\æ¼/\"\ÓE\älc\ÌËµ^¬”Z\É/õıÀz\ÅwûĞŒ\ØUA½ø6’©”\ÙALÈ©ó[\0\Ç\0€ˆœ\ZE\Ññ\åøN=\ìñ|\à\Zf>\İóX­+¥F2ó7ü€\åK\ÅO‰È™\Ì|ù@\æ)zt¬”Z\nÀhøV•ªKZ\é\å\İl­ŠúŠ\0–p3?\Z\ÇñßµÖ™?Œ<œs‹£(º‚ˆ¶d\æ=Ü\ä\0\Æ\ÑE\"\Òm­ı™R*o³ \êòˆ–4®R§Ü—\ï\Ãò\"ún\ì\Èc/f¾=\ã9Z\ëƒı¦_8\ç`Œ¹5‚İ˜ù\Ë\0®B²¢\0k\Ñi\"27\ãiZ\ëubıf\Ğô£\ÕTP•~zå”»aıwúB)µ,€­kG?Ùš™¯‘ç¬µG+¥–«\åbc\Ì\ÃA\Â\ÌcE\ä7HÖ˜\äsÿ˜™_Œ\ã¸Kk]\éSC½ZÀÿõ7È«À\Ìs\Ê^/ùQ+º¯\rˆ\è\\)YkO\ZÀÈ¹E\Ñ‰h=9@:_¸4€\É\ÌüX\Ç3µ\ÖQ\İ-b\ÔK€Oú¿cóZ¹@ê›·[\Ùù·\0|R\';je\r\"ú…ˆ”\â8>\×G\êõ\ç\Ü\ÛQıŠˆ\Ö‘#\0<\ã‹\0û0ó\ì8°\Ö¬”ª\×w=¤¨Ë—\"\"÷ù—K\ÑNYuœsó\0\\\æ\×\ÕZ\ï\ì\Ï/ğ|=\ì+\08š™Ÿ\ãøJ­õ–µ\\\ìœ[E\Ñt\"\Z\'\"“\0\ÜSV¼\r]-\"\ÏZk¿Wk·?Ô©—\0oK_Q\å\Ò\Ö˜y\Z€Oı\ë#ËŠ­‡u`$€ÿ\Ã\Ì\Çq|»\Öz7¥T¿/v\Î\ÅQ\Í‚`Gf\ŞÀø\Ï`#\"ú]\Ú\ík­Wo€ıG½ø€\0€ˆ&+¥VÌªgŒy\É?\0¾®µŞ¸\ìúvc3\Ï‘‡­µß¨e\ä\0Æ˜{ƒ ˜\Ä\Ì\ã\0\\`/Zƒˆ~Á\Ìi·\Ö\ÛğN¢¦/5R©\"Z1\Ã	\0–	\Ãğõ®®®ûóª\ÑT\0#ˆ\èsÆ˜«\Ã0\\™ˆ©‡-\r`­0š2eÊ·ˆ\è\Ó\î\î\î\ÇK¥R\îb%Î¹yÆ˜™\0.°0\Ã\Í\0,‡dÀ²-\Í\Ì_ğ\Ò`¶:‘º¹ci­\×`\æ¹H\ÖP\ç\ÑFyşuqß‰·ı]E\ä\rfn—n¸/\Ş‘óE\ä\\c\Ì\ëµ^¬”Z™§z\ßÄ°¢x63Ÿ!\"·\'Ùºº\ä\Çq|€£\0@D¢\èÊ¬z\ÖÚ‰>j\0^‘ƒˆ\èÁz\Ú\Ò\0¸Œ™§c«õb¥\ÔR\Ìü5¿\ÔW9ú˜ˆœÁ\Ì\êN²u \Öz,3?¤k”ˆ¶\Ìû%\Çqü$€qşğCô\İ\è4®÷N²ÿ¨õB\Õ7Áû&\î\Şÿ“—E\äl\ï$û~İ¬m#\ê:7U1\Èø’6\ÊDD¦•v²ø\0\à@f¾/ã»¬µ•Rışaû¥¾;‚ Ø‹™·p9G\n\0Xˆ\Îò®f¿\ÒZW\æ\Õ\éx\Z¼O©\0·A°{V=¥\Ô(\é°v½mh\å-£µ^™\àpô^\Ş\\\0\à\n\ß\í?“}ugÑ\Ìq;\0;ˆ™y+c\Ì#Yõ¬µ?%¢\ÓaC›ğªˆü–™?”rJ©•™ù\ï›XşCıÀ_}·Ÿ\é\0\Ü)4D€Z\ëı˜ù¯şğ\Ê Íª§”ZYD^9o8„xÀtf>g€N²£˜ùP?`Ù´¢ø?`ù«s®š7R[ÒõI™‰õ\á¯i­\Çd\Õó­\Â\ZaC›±€c™ù…8/\ÓZoQ\Ë\ÅÎ¹EQ]BD›1ó~\0\Ê#w ¢\"ò¤µvªRjT]-o0u™ˆ®\ÄOL/\Ãp$\ÎKcnÉ©ş¤oˆ-m\ÆRHgG1óx\0¯9\çúz¸T*Á9÷¬1\æR\07\Ñ*\0>¤!Y=Ã‰S¦L9œˆ–\î\î\î~¢T*-¨ú†m@\ÃÒ³)¥–öƒŒu\Ä\nqÎ½U7\ã\Ë\0ü\ßF\Ù\Ò\æ<\ä»\Ğk¼oeMh­7b\æ˜‚d…%eP\İ~³hX«S*•>%¢¥\Â0\Ü\rÀ¨0\ß\í\ê\êº+§úóDt†g\ÖşµıR\ßd¿\Ô÷DK}ocş¿\Ş†\á‘Lk-\à+~©oc\0\Ï;\çj^¹i4\rı‡+¥FûA\ÆJ\0ş\ã[Á\Ìi‰8o°g#\í\é\æù¥¾ó¸Ô·3\æC`7,+Š\Ü\Â\ÌlŒy \çò¦\Ó\Ğ\ç®R©´ˆV\r\Ãp{\0+†aøJWWWŞ’Û«Dô­F\Ú\Ó!,†¡ò-×º\0u\ÎUö\êE©TZ\Ü\Õ\Õ5GD~\×\İ\İı8mˆ\ä1(@C=•™Ç‰\Èı¥R\é\İF}ˆş\Òp/];ñ1\0”¦gÔ›\r İ²Z\År\0òñ\×i­+s\ÙT\Å9÷‰1\æ\Ú ¶a\æÀ\ß}Q\0\à\ë\"ò„µöğz]+My\æŠ\ãøR\0\ß\0f”\Øm­ı]\Õ›:”»¼·\ÌÌ\Ìùi­wd\æß ·ó\Ã\ï‰\èû­Ê©\İútlOøû\İÁöYõ|B¢\çP%¸©\0@²\Ô7™¯¨u©\Ï{\áœ@D\'¡\'Tö\Z\"úz+&²›6\êŒ\ãx&€}\0€™w4\ÆÜ“U\ÏZ{ı¶Yvu8¯úd\ì¨u©\ÏZ\Ñ\rğIDdZE?iˆ•UhZ¤–I_\ç~Pf¾\ÉF6}³6^_™\Ë&—(Š,3\ï\à\0 ¢ã¬µ5\Ì\Òš:\ï\Çñ$YQcf—\ç\Ña­=™ˆNh¦mC„‘\ì@5\Íóx.°\Ö\îFD³ü\á<\"úb3ó\"65VUD\Îğ/ƒj­ 9·ı2R’Æ§ùpv\é\ë‚(Šn‘_û\Ã\ÕD\äW5±7M 3_\àEøM¥\Ôg\Õ3Æ¼\à\Òf\Ù5	\äÃ¹#c\é+U3Ÿ\Õ`r3“r6\Õ T*\ÅD´8\Ã}\0Œ\Ãğ“®®®\Ûsª?CDGcx.\ÏÕ“ˆ\'¢ÿ\í\ê\ê\ÊÜš¢T*}BDo‡a8	‰ó\ÈH¿¼\×pšş\Ïõ\Û9\Ì°:€·‰h½¼¤\àq_\à«M5p#\"GQtmV™\ßd¨I\Z½ùD´¶s®\áAMw*•J‹‰h…0	Àra\Î\ë\ê\êº/¯º!.¨a\î\àZŸ&¥¾wZ9C`\Ù\î\î\îûs\Ï6Ú¦–$\Ì‘ó\àDô¥T\å¦\Ô\0\0c\Ìı\è\í|Y08–g\æ3ò\nE$õb3÷9€©- 1\æM¹\È\ádC\êLD\ä\Ì&™5\\\ØWkı¹¬y~^À\Í0¦e)\ÃD\äø´lDô“¼$@\Ì|€§›h\ÚPgr\Ü\Şüzp\ZJÑ”‘p\ËhŒyÀuşp‹¼b\ç\\\\6XP˜¹ZLJ\ê==Zk]\Ó\Ş+¡¥IkX»ÀkM1jx°f•²÷\Ê^7<a@KhŒ™@ü\á.Z\ëÿÉª\çœ[\ä»\ì‚úP\Í\å¿<ª®ß¡¥\åic™9]\n8Ù 0¯Ş…\èı\ë, ~¾/Uı\ßOŒ1\r\ÏG\Órú]2ÿ\å\ÊK\Øèœ›/\"6Í°!Œˆdº\Ây¾\àÿv7Á”\Ö\Ğ9‡²\Åğ‘\Ìü£¼º\å\îı\æ\É\\ş\ÔZ¯†@¦¦\Ì<´\\€\0À\ÌW¡g«‡©J©U³\êù\Ø—ıA \"gT‰?\à—gE¤)2\Û\"!†\á\î\0–\îGñ÷ši\ß\âŸS¦L9²T*eºŞ‹ˆ\Ï=sé¥—ş(o+\İz\Ò6&J©•|ñh\0¯\Ñúy‹\áqÿ\rÀ\ŞM5°óy‰ˆ¶w\ÎeNgi­\×g\æ\çø>A\å\r¡-º`\0pÎ½‡$º\0\Öd\æ\Ü\áòùÃ‚~ñ©<ñ\033ñADš–0ªmZ@\0PJ­\í§Fxˆ¾.\Çñƒh\Şs\ÌsD4Á9—›Fk=™\ïA\Ò U\í}\êMÛ´€\0\à·)H7µŞ˜™\'\å\Õ‘¡œØ²^<GDQ5ñùT]ğZ‘7K|@›µ€\0 µ\Ç\ÌÿBb\ÛAdfğ”Ï¡wş“‚ñ\â\Ë\İ{D)ù€t–ƒ 8 9\æ%´U\0Æ˜§\0\Ìô‡\Ûj­óöû´p\Õ\Êå©¾\Ä\0\Ì|\Zz\ÄW\"¢\Ã\ZoZo\ÚN€Àgœ«R\ï\0o6Å¨Î¡_\â³ÖND?ó‡\ï‹\ÈşyùI[\n\Ğs\'€4…\ØD­õ¸¬zÎ¹D\äü\æY\Öö\Ìõ\â«\Z\×k­=ƒˆ\Òu÷…\"rPE-Ù©ª-ô\ŞG¤Vğ\\ô\ìC<œY \"TŸR\n\Ö\Úi>\Ùyz\Í\Ä(Šnm’Ÿ¡\í!)~ñ€±\01shŒ\É\ìV\â8ş€\á¾:rN¹\ë\è~Àq€øS‰\ÈşQİ–wM3h\Û\Ğ2\Îò‡£ü\Æ-™0óYhİ®\ë\íÀb? \ÈÄ‹\ï\\ôß¾­\Ğ\Æ- \0(¥–õ1\Äk ‰U\ãWL>C\Çğµ¦\Z\Ø>\Ø 2£Ø¼ø\Ê{ˆEdŸ(Š¤i\ÖU¡m[@\0p\Î-ğ¿\\\0X™™s3zV7\êTó\\a\æ G|´“ø€6 \00óù\0>\0\0\"ú‘Rj\é¬zÆ˜¢Ç½X!\"ÿ\Î+#¢cı\ËDd¯v\Ğt\Î\Í‘?ú\Ãu«\Å\ãV°Z–\Ôtï·¼·K[\Ñö>C\\¥\Ş\ß\Ñ\ã\Ş?œ\È\Ì2\æIsÁ¬\'\"¢”j«\İI;B€Æ˜—\0\\\ã7\×ZgúV¸÷˜9\×+\ÈO8§i^Dl;‰°#ôŠƒßš*¯^¹{ÿpaÏ¼M\ns\ï\Ñ\îhSvŒ\01˜\íw\ÑZgş\ês‹\È\ÙÍ³¬-\ÍÌ¹ñÎ¹÷rD˜™#¦™´õ<`%Zë½™9Mœø— 2$\îıÃ…yD´…s.wDì¿—Y\0\ÆûS©¿`\ËzŒi%ƒŒ4ùöWµÖ™û‰T¸÷V‘«óR\İ™-\áÆ¾%\ìwvız\ÓQôƒŒtªedÏ‚¿Aõé‰¡\È\"re\'‰°£º`\0PJ‘—\0¬\àCfcŒ\É\ÜW$\ã‹4\İÉ²\r¸ˆ¾\æœ[œW!£;~ÁÇ”šcbBGµ€\0\àœ[\\æ¤°|µa?1\İô\í§Ú€I\è7‘»”RM\rq\è¸Xò\ë`e\0ox\'…¼\â›\0\ì\ÛTÛ‡¾%\ÌMg’\Ñ¾LD\äœ{1\ïšz\Òq- üz\Ë­ÁÌ¹\İ\ì0^€Däš¼õs ³%LWL\Æ6\ÃÀ °dyn!,¸+¥2?K…{?\0\Ü\í\ç	‡\Ë~tû‹\Èuy\ÕÀî‰\ï©i\"\ìX\Zc^p…?\ËÌ¹û‰0ó\ée¯¢\èX\"\Ú@\ÕÀ!\Ä~ı\á;¾%LEø9/Â†\æŠ\îX½}8)\Ì\0ğ¼?\Ü\0œs\Ï0óÁ>\ÔûŠ\Èõ¡m¤;rRN\Ç7˜\0Ì¬|—û¬µG\Ñ\0şÁW\ÊÎŸHD¿lµmÁ\ÍDt@µ®•R£ıÀd[\ê\ß~`Rww®nŞƒŒ>_\n\à\r\0\ãµÖ»§\ç£(:Àõ´±\Í\ØKDf(¥–Í«\Ñ®#\"·+¥Ö­·1/@c\Ì\İ\èÁ\í«µ\Ş4«^¹{?3ŸQ>h!¢ox¨\áÆ¶{‰ÈJ©\Üm2D8FDnVJ-—w\Í@\èø.\0¬µQº\ç\È%A|;«RjU?¸‚ˆL¢\èee\ëŠ\Èı\0\Öi‚\É\í\ÂmD4±Z2\"ÿ\İ\àóş\ÔEA\ä\Æ\æ\ÔJÇ·€\0À\Ì3\0¤\ëš\ç\ë\æœ{À%\0@Dg(¥V/+{…™\'\0x½\Ñö¶»‰\È\Ì>ºã·˜y?\0\ïúSSµ\Ö;\×Ë€!\Ñ€µö\"º\0D\ä\×Qı,«\Ö:d\æç‘¤\'Á\å\åJ©ME\äo\0\Â:›x§ˆ\Ü.\"ó\0,°\Z3°€†\ïH\Ô³‰h_\ç\\n†	k\í7‰\èrø}Ù¹Á§‘2ô1\Ä\İH\â#\Şñ\Ës\ïfÕ\ãø\Ï\0¾\0Ì¼1¦|¢\ZJ©\ÕE\är\ä\ì©V‹\\\ÆÌ¿4\Æt\çØ½*3ÿ„ˆ°\Â \ï7¬\á‡Y…>¾\Ø\Ø\0˜y\ßzlj=d\0\Ö\Ú\ã‰\è\0‘\ã¢(\ÊLß¦µŞŠ™ô‡÷A0>«µö0\"b\0c*Š\0¸™ÿ\àMf\à‹u\Ş‘¯FQ”—l½J©D\ä&\0™‰˜š\Äl\"\Ú+oŠFk½½Ï¤\n\0·A°\×`o8¤¨”Z\Å{B¯€d\î*\Ì[ˆ\ãøv\0\0@D¾E\Ñ\ïs\Şs\í\à+HºÊ—D\ä\Öò$@qŸ\n\à\çe—•ˆh—Zô½cÀLøV¦ˆ\ÈEQ\å2\â8¾\Éü\àb\"Z+kó\ëZh‹m\Z\êE©TZ@Dk†a8ÀJa>\ß\ÕÕ•—v\ì?~úan/\"\ÓK¥\ÒgFƒ¥R)vÎ•œsw»„GK¥\Ò\åu˜ù\0©wö‹\ŞÍ½{\0ö/‘k¦L™²=\êÿ\Ú/\Â0\Ü\nÀ}Î¹²Ê‰h¥0÷\00¢»»ûŸÎ¹\'³\êõ—!1\n.\Ç;\Z,ª/\ÏcnŠsUf>y ÷³ÖŒdƒ \Ù\Ã$\ZŒS§s\î\"\Ú-\ÌòÀ\Ì:¯LDf—\Õ\Ûa°÷\Zr4Æ”\0\\\í7Ë‹!z‡z\Ñ÷¬µ÷÷>J©e\ã8¾„ˆNğ§Rñ\Í\áe8\ç>l±·Ï‹·‘Ç‘<Àfƒ½Ñ ğ™\å¹\Ü\ä–\"r5zv]n­\ís­õ\"2À\ê9¿\Ç+y\×(¥FXku\Çó\ã8^\Çñt¥ÔŠyõ½÷FO(j³©¶«z\êØ±\Ñ`o2$hŒy@º!_¤µ\Ş:«sn13\r İ‹d\"ºÁZ{T–¡Rj-k\íy~şúŸñõ\Õ\Â!¹Ø¨G#\ÙfªˆÜ¦”Z)\ï:\ç\ÜG¾%\Ì\Ü\\°‘Qµ ¥tÃ›U{Ÿ!5\n.Gk½3\Ïò‡\×AÛ½ZkND§Vœ.¸‰™\ßd\æudj\İ@yœ\Å\Ó~´\ÛWBğ‰(ğ^€d\ß\ã5üñ?ˆh÷¼¼‡@²—‡w)\Û=¯Nø]Gg\Äq|€\0|A®{W’- \0ˆ\Èm\0ó‡j­·È«E\Ñi\"r\"zZB\0XÀ\Ñ~«#\0\ì‚\Ş\â›ED_\éc \ã?”‰o¡ˆL‘\ÑÓŠŒ‘Yıh	\'˜•W§ŞˆHµ%\Éô\Ñ\áƒ*uúÅ s.€\ÕR\Ø@E§ˆ\È^\è;»\Ö\Ë\"r$\ííœ›ŸWI)0ó\0\Ò9µ4!ø-Q=\Í\Ì \í¶û#Â…^„MI(.\"OT)N\×\Ú½›\æ\í‚S\â8\r?M\"\"‡EQti_\×h­· ˜ys$K{óD\äY™-\"÷V\Ùo·ü¾\08\Êf&WJm\"\"w ‰q€ûˆh>º\ãeD\ä\0ƒ^…¨\Âb\"Z-k)\Ó\Çe¿dRş\ïA\ì3˜\ryj­7g\æ9H¾°…Ì¼“1fN#\ïi­=ˆ¾\ï?‘ı¢(\Ê\Í*¥ÆŠˆ\0Hõ\ç™p”a:b@n\ë9\0.\r‚ 3Ò°|9NDN‰¢\è\ÄÁ\Üh\ÈvÁ)Æ˜\ÇE$]&[†™oVJ5l½\ÕZ{n™ø>$}\îTŠs\îy\"R\0\Ò\rÇ‹È­}tÇ‹ˆhz¶4{QD&#\ÙM~°\Ïe\ïQ®¨ˆhIŒuù¤ô@ò- °d\Z\ä\0ûûSÿfæ½Œ1U»®\Æ{Œ‘\é\0&ûS\ï{ñõ\ËgÉ·„w \Çñ¡?\İñ\Ò\"r€ı\0<ID»\0x—ˆv#¢ˆhK$\Î\rıN\Ã&\"‡FQte\ÎıFø´(c\0¼IDkWKÿ\Ñ†…\0%¹@úÌ²@D¢\è‚Á¾·\Özkf¾À\æş\Ô;¾\Û\í—\'L™úVe}\ê\"\Ú\Ó9÷~•kFù	õı‘¬\Æ\ì\çœ{ºÂ¾ÿB\"Ä±ğ›RKbh–„0ˆÈ©Q_\ås\Ä\Ìi¦\Úó‚ 8¦–Ï—Å° °\äŸu	zvˆ€G™ùÆ˜š“´\Ö\ë\ÑO‰\è(ôLÑ¼\ìE3 Ez¥\Ô\"b\Ñ#\Â{ıûõ\Õ^ƒD„\ï‰È‘Q]\Õ\Ç}FŠ\È\İ\0¶\099Š¢“ú¨ÿ0ü<3obŒt”Ü°`ŠµöûDt&z{\"\Ï‘E\äzc\Ì\Óy\×*¥–\'¢ı%\Ñ{np&M¬‹’Rj}/\Ât=ö\ï§×—¯\è\ß\Â\Ì\'\Zc¬¬«µ\ŞÁ\ï.µ-\0ˆÈ‰QR\Í&k\íO‰(\rğ¿2‚Ckı\\YKK6\Æ>=Ï…\å¼\à\0ó‘Œ0#\Ù\î`$-@e®•×½\ì\å¨J©1^„i¶ªş´„#˜ù¿\rkú¿}ÀƒHğW°€5}\ÙùN\Ş3_ŠµvG\"š\äs¿MD_p\Î\Õ%vf\Ø\n0Ek=\Ş\ï&t €Z—•‘™¹«Z<\Å@QJ­\çŸ	\Ó-}¶„À’\Ït2¼\Ãm¸Š™\Ù\ï@PÍ†\ĞG®	\0\"2)Š¢µ}’|†½\0S”R«\ÑWı–[\"ñôX­¬\Ê\'H²\ï?%\"wˆ\ÈMÕº\ê:Úµ®o	Sö\Ù¦h­\×0ˆ¾@Dk0ó\\\0‹ˆ«6°)»÷?2\0\"rfE¹\ŞE¡`”R#‰h\r\0‹Dd~V@\Zd\Ç\ç¼7ö§ú\×\ázñ…ş\Ô->h©®\ßA!ÀA)µ¶a\Z ~_ÎŒüZ\ëM˜y6z\æ-\íÓˆÇŒB€„¡ÀgøBŸ{€s\î\å*—Õ„µv;\"º	=\îb³ˆhÿj\ÙÃ_ŠJ8\ç^%\"B›\ÙV\"ò¸µö0¥Ô \Ş[)µŒµöT\"º=â»±¯\Ôƒ¥`‡\áE¸3z\\õG\Ñ\Å\"2»<\ëWQJ\ÒZSD\'¢Ÿ\Ã\ÏkŠ\Èo‰\è@\ç\Ü\Â:šÿŠ.¸Cñs~šˆG\ï\Éğ\'EdºˆÜ’7J÷ƒ«­‰h\"}=ó‚\00ß¯¤\\um½)\Ø\áh­¿\ä7õ\Ş>£ø]\0\Ï IEü€U‘8Œ\Ågó\Ñ|\n\à*\":\Î9÷\ZšD!À!‚_^û.’XZrÌ¼\àJf>\ß“Œ\ŞH\n1”R+Ñ®Ì¼+˜\r´|+\"YZ|Iz‘GD\äf¹¯Uó›@!À‚S° ¥,h)…\0ZJ!À‚–R° ¥,h)…\0ZJ!À‚–R° ¥,h)…\0ZJ!À‚–R° ¥,h)…\0ZJ!À‚–òÿ¸\\a\\*Q¸\0\0\0\0IEND®B`‚','Cursor que hace click automaticamente.',1),(2,'Abuela',5,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\â•T\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0\03tEXtComment\0xr:d:DAFkYeWKoDI:7,j:48205749140,t:230530098#c\0\0iTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>producers - producersAbuela</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-05-30</Attrib:Created>\n        <Attrib:ExtId>2ce55a34-0b7e-4fa2-b36b-cf277bd91518</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>¿ö\'\0\0(pIDATxœ\íy\×uŸ¿so/oŸ\r3¬3 @l$R¤H‰’HLlZ²T‰#¨Ç±c\'²+Ë–JK*v*³\ØLÙ©\ØJ\"•³\É\åÄ’m*f\âˆJ$9Sd¤ˆ‚$ˆf_\Ş\ÚË½ù£»\ßôM\Ì@HOÕ«yõ–\Û÷\ß=û9=\Â[tC‘ü 7ğ-§·\0¹Á\è-@n0zŒ\Ş\ä£·\0¹Á\è-@n0zŒ\Ş\ä£·\0¹Á\è-@n0zŒ\Ş\ä£\Z\Ñ\ÑQn¹\å¬µ\ìÚµ‹\Ï~ö³?\è-­;9?\è\r\\ö\ï\ß\Ï{\Şó<(\ÖZ\î¿ÿ~\Ûh48}ú4\ßü\æ7\Ğ\Û[7º¡$dtt”}\ìc|ğƒ”S§N¹333;]\×ı€µv‡ˆ<V­VŸ;u\êÔ…J¥Òºıö\Ûy\ä‘G\ì\Ø\Ø¿ıÛ¿½\êz‡bÇt:~\çw~‡G}T5\Z\r{\ê\Ô)ûò\Ë/ó\ĞC]\ç_øı\éÈ¡C‡aÇ\Ü{\ï½jzzº\\(nş¦µöGDdTD°\ÖF\Ö\Ú\"r\ÔZûMk\í7›\Í\æù={ö4š\Ífü\ÄOØ£Gp\ä\È<Ï“‘‘\Æ\Ç\Çu»\İ.Zk¬µwˆH¹P(|kqqñr½^Ÿz\ê)û\ío›—^z\éËˆ”~ €>|˜Ÿş\éŸfûö\í233Ó§”úQ\à\'÷)¥­5J)1\Æ\0Xk­\ãX¬µ\0\à{ÀŸYk3\Æ<\Ûn·\n…\"\âh­w\0·w[k\ß\Üô¤—>kŒù’ˆü×©©©£ııı\áÀÀ\0?ş8<ğÀu\çC®; £££|ò“Ÿ\ä\Ö[o•Ó§O{J©[\Ê\åòE\ä\Ã\"²C)U\ÔZ‹µc\Æ±\Ö\"\Òİª…ô¹KÀ“@¸[D¶[k{D¤(\"(¥$%Œ16cc­¾\rü\çB¡ğô«¯¾zùÄ‰¦\Ùlrúôi{\ì±\ëÍ\ëÈ‘#G8r\ä7nTccc}®\ëŞ­”ú›À›µÖ¢”k-qc­\Í$Teuÿ*¥«”pR)Ê€\Ê7ÿE)eµÖˆˆ5\ÆH\Ç\Ö\Ó^‘¯\Ôjµ‡‚ 8\Û\ét\Ú\Ï=÷œy\æ™gx\á…8{ö\ìu\á\Óu\äK_ú’8³Y)õ\ãÀ_\îÊ«¥8»@,Û \é	Ï€`9»d3\ĞRp\ÄZKş‘~¨»®\ã86U‰&»>0ü/\à¡8ÿ÷\Ü\Ü\Ü\âÅ‹\íõRe\ëÈ‘#G¸õ\Ö[{8ği\ào\0›•Rnzº%/\r£W2%\0\Ùû9	Yõq5²\ÖEq£”\ÂqD\Ä\Äql\ã8¶\Ö\Ú&pø\Ó8ÿ\í±c\Ç\Æx\à«/ºF´®€\ìß¿Ÿ\Ï|\æ3¸®û£Æ˜/:SËŒtf`I%9ƒ\ã¬\Z)¥H¥	H˜jŒ¹‚ñ«I\Ã\Õ(C\â8î‚®µFkm³µSuf€/x÷±ƒ6·o\ß~­ly]\Ò\ë¹ø‡?üa\Şÿş÷355õ»\\\×UqK\ê)uÁ\0V#;½®\ëv\ß3\ÆtOw\È\ëIF^ºVJœÖº»fŞ‰\ÑZKú¾cöFQt\é\äÉ“\ÏV«Uşùõ`WÂ‡u[Ø³gœ<yòf\à‡µ\Ö\n’Ÿ?‘QuWJB@\Îhw¿ŸWsy òLÏ¿ÿnFv(Šº\×K¥\Ïó\Äq¬µ¥8ÿa¹\\~t\çÎ¯‘zz\ëAj½Ş¿?›7o\Öq\èSJ\ÙL*²SŸ©\×up]\Ïó¢(\"\Â0¼Œ•”½«”ZU¥e f6\Äƒ\Ö\Z\ß÷q]·N¶f’\ÖZDd›1\æŸ\Ş|óÍµ\Ïşó\ëÅ¶õSYŸúÔ§Ø¾}û†(Š~]D69#™\Íp‡(Š°\Övp§+1\Ù{«©›¼û›Qö]\éª2`ƒó\ê*¿F\æFg³\Ò¥\î8\"\"Æ˜\İZ\ë\×nº\é¦\×%º_7	)‹\Òh4\Şc­=°®W“¹˜®\ëvO6@]f®dúJû µ\îJp\Ğy\æf\ê2UCİµRw\×u»{Ê¾†ašh­]\àS§Nº\éÈ‘#\ëÂ·u‘ó\ç\Ï\Ó\étŠÆ˜\ìwGH]\Ü\×u»§\Z–lKòñ‡Öºkø³\×2]Ÿ·K\ç\áû~\×ğ\ç\×\Êb”Lµ\åÁ\Ê\Ç\'\ÙÚ¹@T\ÒÆ˜>\ÇqT­Vû³-[¶˜\'Ÿ|rMy·æ€Œ²a\Ã\n…\Âm\"òi¥T\Õq‰\ã¸\ë\î^Í½\ÍÛü#¯N2F§ñË²À±X,\â8­V\ë\n0¬µ¸®Ûµ+™¤\0]©\Ì(‹ò¶+;<*1†»\Ã0|º\Ñhœ½t\é“““kÆ¿5WY{÷\î%Š\"‘¿b­İ¤µ\×1¹`N_gL\ÉNµ\ïûx\×ıñ\Æ\Â0¤\Ó\é,3ğ+][\ß÷)—\Ë\04›\Í\îûJ\Ôª\Ïó¼eÀfF^:3»’–¥sHR/h­{¬µŸÙ½{w\ß\'?ù\É5\å\Ö\\By\ä:Î€ˆü\Ì\ÔU\æ±ä½™,¾\È\ë\ì¼¬<\å\Ù\ß\Ì~ø¾O¡PÀu]\Â0¤\Õju™_ô<öl\ÛLE´ƒH$¡P(\äc\î\éÏ«©l/ù\ç¹ZòV\àr»\İş\î\í·\ßn\×*¹¦q\È\è\è(O=õ”T«\Õv\ä=ŸŒò\'1cBfŒ¯Yç½°\ìK\'7‚ \è~¿\\(°o\Û*¥\"\ÆZ\æ\ZKR†!\Åb‘F£\Ñı~\æşf\Ş_F™­ËGQ„\çy’‚¢1?^©T~oÏ=ók\Å\Ã5dß¾}\0ù\ÖÚ¢Rªk\Ìóª#\ÚóA_F™\Ñ\ÎÛL…\ÅqL§\Ó\éJ\Ò\Ê5û*ömßŠ\ç8`a Z¥\èy4; ñ\Æ2\×jµº\0DQ´Ì \çˆÖº{­TrDD\Ğ#\"5­õk,®) >ø \'Nœ\Øk­}o¦ZVü\Õ\Ò+y@¦Z‚ XÀj¢\ï:l\ì\ëcÛ†D\r’H£[ú9yi“~·\ÕjQ((•JA@§\ÓY\æ\í\å÷¹\Òõ^ñ;z\ç\æ\æj\Ó\Ó\Ók\Æ\Ã5³!GaxxXi­8\ä8d‰\Ä|/3”™Û™¹\Â\år¹«²(}5c~%.[7°kó&{jË‚ÁŒª\Å\"®\Ö]Õ•9™›\ì8Î²€2£¼;½·\ÒU\ãøË·\ÜrË…3gÎ¬I\ÍdÍ¼¬#Gˆˆl\ŞKQò\Ê™wU3 2£\Újµ¨\×\ë´Z-‚ Xf{`y°\è:\ÛyÛ®›¸i\Ó0\Å4@\Ì6¯\Z·l`ÿö­¸\Î\Òl·\Û4\Z\r\0\Ê\å2¾\ï_a\ãV‚œ‰µ¶\\©T†>\Ì\áÃ‡\ß4\ïò´&*\ë—~\é—\áÂ…‡¬µ»²@*g”Ì³SŸyIav?c­\Íjµ\ÉwDpµ\Æs]ú*e6õ÷Qp=®°#yÊƒ¸¡V\Ã\Ñ\\œša¡\Ù$H\Õ`³\Ù\ÄqœnN«\Ó\ét%(\ã\î\ÉÛ¬tm\ÇZ»ùw÷w\å{\ßûŞcC¦§§™™™¸pV&\éV2*;yù€«\Ùl‚¥Gk|×¥\è{”}Ÿ¢\ïSğ\\|\×\Å\É¦ò´\Zù÷2Fö–\Ëô–J´Ãˆùfƒ©ùE¦ˆ\ÒÚˆ\çy\n I\å¬\\ø\Ø688H©Túóm5Z@\æ\æ\æ8}ú4\Ã\Ã\Ãcù:\Ç\ÕjyWXkM§\ÓÁÑŠ]›6Q)ğ]G+”H\ÒÅ°\Â1Èƒ¼ˆ•Å©U¡\à¹½^6öö2>;Ç‰‹cch·\ÛDQ´ÌµÎ¯“w*\Òß¸­\Ùlv¥ûZiM\0QJáº®.’Ô¶\åõ’gp\0n\Ù0ÀPo\Ïòˆ¹û\ÜbbCœ:AQğ\Ü\îI^IQ\Ój·ñ=Iƒ9Gk$«6f)‘ôó\Ã}½x\æ\Ä\ÅK´Rne\ë*€ˆˆli6›<û\ì³\×ÀÁ%Z@Øµk\çÏŸ¿X.—›@™U\Ê\ÃÙ\ÌÛ•8q´f\Ë@ÿ20&¦gx\å\Õ\×8{şgÏgbršF«I»\İ!Šb~õÓ¿Ì­ûö VJ0=;\Ë?üÌ¯PH\íB_#Û·2²m{w\ïbx\ã ’\ÛbµÊ¾\íšW.Œ\Ñh·—¹\Ø+%=\r$%\İ\ïğ\à\à`\åñ\Ç_\\‹òîš¸½gÏettT|\ß\ï­T*\ÊY…0\ï)­’~\0`c_/[ú±@½\Ñ\ä[O|›¯~\í\Ïhµ\Ú\Ôzª\Ì\Î\Îqiü2“SS\rn\àm·\İÊ»\Şy7\Å^QF\ç2v\é2“Sœ9wNR)•(—K\\»\Ä7¾ù\Ó3³lİ¼‰b±\Øı\ïºÖª\Ì6\Z©”dnyV«¥ô1\Æ\Zc:J©?|\î¹\ç\æ¿ò•¯\\3/\×,0Ü»w/Z\ëykíœˆl\\ù~&\æ.t4\0Gk6ôc¬efn\Óg\Îñ·\ßÁ}\ïı!\\­°£ˆ(q=?}ı\êN\çºü\â\Ïÿ,a\ÓnµºuÚ¤N±0;\Çw¾÷,»o\ŞÉ\íÛº\ßõ½Ä‘¨·\Úh%\İ\0–WsjÌ·\ÖŒŒœc\r¢õ5‹C\ÒÀj˜\Ï\ÛXúAƒ½=\Ü1ºš«1&qkû«*… ¤¾X\çö\Ûn¡§VCcIt¾£\ßGXk®X{\ås¬Á¡R.\ã».’1\Ò<¥\Z\ÜÀ}‡ßƒ5–NÎ›‚\äÀ\0ld¨¯w yP2@€\çÎ[·w\Í\0Ù±c‡\í\ïï¯‹È”]\ÑQPô}öm\ßN¥§‡\Í\Õ*‚E\ËP\ÑG)…\ï{\ìİ\ë¸(¥s)µ,©˜¼\î¬\êúf”¨”4\r£–¾¯”\î¾.¢ğ<İ»n¢¸\Â90\Ö\âh\Í\Æ\Şön\ßF!\Í d\î:t%^\0_)µñCú=t\è\Ğ5óq\ÍT\Ö×¿şu~\ê§~*x\î¹\çÎ±\ÔE(\0Z)vo\İBA+\â0 `€\Å:‹\í\ÒlbEø\Î\ÓO\Ñj6)U\Ê,.\Ö/\É÷—\Ò.€ÒŠj¹‚ˆP,Ù·o\Â\ÜI\ÑÓ§O199‰µ–\Åz\Ø\ÄX³”=‚€b±@µR!ŠB\æ\ç\çy\ß}	\ÏM¢ı\Øú«ŠJ¡´\æ\æ­[xõ\â\Ø\Õ<-\'Š¢\íGÕ»wï¯5\r¿f€<ğÀ\Üu\×]ˆ\ÈÅ•I¸‚\ç1\ĞS£½0Góòeú÷\ìcsµ\Ì+\íQ§\Ör\ê\Ô)&\çˆ— Šx\Ç;\ß\ÃñSu|/\æÂ™W\ĞşF¶T‘²\â\Ö={\ã\ßø\ZC‡™™™%61½½½8Z3=3\Ã\íw\ß\Ãs/\ãô¬en!¦§l¸<Ug\Û\È.ö\í¬òô·Ÿ\Äw]¶n\àô\Ë/ó\Ş÷Ş·´g„\á\Ş\æOŸ¤84\Ä@O…\É\Ée™„¬LR´\Ú233\ãNMM\Å\\#­iÅ°\Ùlœƒ\åú<ˆ\"\Â0¢==Mc|Œ\Î\Ü,µR‰b§\Ã\â\Â¿÷_\â?=ô_yõ\Üy\îy\Ïñ\Éğxû;\ßM¹ga{š ˜G´\Ë\ío?\Ì\æ‘ŒON±apˆ?úiÎŸ?\ãhJ\Å“<ö\Ä´cÃ¥\É)¶\í\Ü\Åmw¦X®bLƒfı2¥\Ú&\Ş~Ï»ùø\'?\Å\Û\îyO=ÿÿû\é\ïğGÿ\í¿\Ój·±\ÖR+—ğƒõKiOOFA\ç\Üõ,p$1\ä[K¥’[*•®¹z¸¦\é÷—_~™\\HE,6\Z”\\‡\Ò\ÆMÌŸ>I\ï®\İôtš¸ª\Äı÷½—J­\ÂB½+0~iœ\Ş*eŸ3\'#\Ê\ÕAzú7\Ñ	\"\î¾ı\0/=Ê…ó\ç¹\ë\î{ø«ü &N~Jñâ«¯òä·Ÿd\ßo\ã\Ö9ö\ÚWeúR›m;\àû.‹‹4g!¸÷®»8x\Ó(÷½÷}øiywcµ\Â\Âñ)mÜ„v\Zi\Ş+Ÿñ\Í\×M\0?+’]+­) ?ñ?a;v9\ãip¨µ&6†\ÅV‹\á\í;[M.?ó]Z“øXT0\Ø\×\Ë\Û\Ş\Æ|£\Éş[o¥\Ój\Ö\çÙµÙ§ì¿›jÉ¥¯Vd÷h\rÓ¨sóömŸeó\Ğ\Æ\ä2\Ö2\Ô\×Ë–M›¸y\Û6\âFmı‡\î\Ş\Ë\ì\ÂÅ\Íh-\Ğ\ëû8@st„\'_cxh¨\Ëğhz’¨\Ùd`\ï~\Üb‰Ó—\'ˆs1HVBˆ¢\Èˆüq¡Ph;v\ìš=­5\ä\ç~\î\çø\èG?:\ïûş´1¦X­µ¨(b¡\Õ¥l¡53…vLbÂ\rıœ<ù\Z\ß\Z»\0€ˆ\"	B,‹\ÓPÎ¾\Ä ôöõq\ç\Û\î$n·P®*Q!ƒØ½c\ßx\äO±\Æ\"®ƒ`Á&\ËK\ã	c±’8Ü¶¬LĞœ¸œd™•¥Xlµ»\ïg=\06!€3Z\ë‡o¹\å³sk\nH¹\\&\ãp\Ü³=3|\Úqh¤\å\Ò\ÄC1øµ^‚…y\â  *}ı¼\ïğû0qL\Zv£¬,83a\ÚõĞ®‹µ–ö\Â<^¥‚¨¥¤\Ã\î›w³ó¦\Äi\ÙV¹.d\É\È{–4{\ÜU±\"x\Õ*a}±\Ût±˜6O\äG \Ò\ßb?Ü¶m\Ûå§Ÿ~úÆŠC\0^|ñE\Æ\Æ\Æ\ê\"ò Ç±¬£5a\Ó\n´\ç\á‹ø}}ˆ\ëb!\îtº\Ì\ï\Æ¹\ØCiv\Üb·PDi½” 4&‘¦e\Ìs‹E\ÜbkP¹G¾Tœû2~­§XB{­  –xó\ÒaŒ±\"r.Š¢‡\Ç\Æ\ÆX«~\ß5\äÌ™3\Ì\ÍÍ™M›6}UD^X\ÖC%\Â|£‰v=j#;ğª5´\çµ[2õû³\Ü·kb\Z—/Ñœ¸L\Ün_ı³«\ĞÕ®\åU«\ÔFFÑ®\Ç|£I”+Rù\Ä\ãW\Ç\Æ\Æ^ş­\ßú­³\r\àµ\×^\ãüùó\r\Çqş½µömq{i}ñ\ÙY6o 44Œˆ\Â)$‰½`a\Ä^\É!¡›‘Mp\Íf<—¨ºeºPL\íV¢Öº´¤ô²¤e\Åu\ÒkXkS\Õn¹‚[*\Ãø\Ì\Ì2CX“xuù[¶l	}ô\Ñk\âYÖ¼s1Æ\ãø\ëÀ\éi²\"\Â\\½Á\éK\ã\é\'-…ş~”\Öt\æ\çˆ[¹\Ó-\\q¸W&umºXB¹nª\nK ’¼÷:\ß\í®Ÿ²†\ì(\İœ¾4\Î\Ôü:\×öš›ªú\Ó8_Y\ë›¬K÷ûG>òzzz.\é[H\ìÃ™ñ\ËL\Î\Ïcã˜°\Õ\Ï\'Z3S\İ\ï\'¼’eõŠ<\Å\í6ˆ[-L$\Ç\ÚZL·š\É{W¨¯l\í¥•W®\ßi·iLN`\ã˜\ÉùyN_\ZOl\ÏR\ŞÌ¦µœù\Â\Ğ\ĞP\ëÿ@\0<ˆ\Öúa\àtf\ÜE?{c\'Oñ\ìø$—U\ÒCÕš˜HOj\æc]‚\Å\âN‡Ù“¯2\ê$­\é)\Ú\ÓSÌŸ9\Å\ì\ÉÄÁ\â\Â÷\Ùá•ö\'/Oò\Ì\Å\Ë;yŠ\ãg\Ï§\áeMÀw´Ö8p`\Í\'©\Öm`G)Å¾}ûšAô\ïV\é\ä¾¡„,t:„\Æ‹¢‡Ø°Cy\ã0\ÊI2«¯×´ ]—ö\Ün±„[­Ò™\"l\Ôq+UDi\âN›Bÿ\0*\×\Ô}5\Ê\ÔU;x\åü\ÚQ\ÄB\')ã®˜ª²i—e\ËZû™]»vû\Ü\ç>\ÇZ#¬\ë\îK/½\Äñ\ã\ÇG€Ç´\Ö\Û\ÓF8É¦_³\rl[\ÔZ\r6\Ür\å\Í[º­?+)\ïÆ6¢”\ã7\Ş&Š°q„ö—R\ê\ß\ÎMLòÒ™s¤\ÍG(¥º\Ã@\é\çl\Ú\áø\í\Ù\ÙÙ¿:777ù‰O|\â\Í1\æuh]§pO:\ÅğğğBµZ\İ¼+­CK\Öã”‘Uš°\r\"”7B®\É-OùN\ÑKi÷¼ J¡rõoD:\0Ÿ=O;—‹Z1¢`\Óœ~ıÄ‰ş+¿ò+Qv¼!Z7püøñ¬ñ\ì­µ\çó¶¤;#4Ex>Á\Â<Q§\r¼~\'|·‚§„®¯j\í2 _¯Ä»’f\ëu\ZnE0‘g”\îıe\×uñ<oİ¦p\×UB\æ\æ\æ¨\×\ëlÜ¸q¦¿¿—µö®LJò]–DE;Müj^µ\\½… n¶Xx\áå„¾‡5†\Îø‹\ÇN\àöö Suóz’­wr\ìó\æ²\Ï\æ\ãô\î!ğo\Â0ü\Úg?ûY»–SSyZW’\Ñ\ã?\Î\Ä\Ä\Äı\"òÕ´VòwQ°\Ö\â;šsT60tğm\İ\ÔÈ²>­,^0†É¯?ÁÂ³\Ç\×Á\ë\ï‚\éYlRÙ»‹¼I™úzÀ¶ƒ€§§“¶f¯\çú|m†6\ãó\Ö\Úw\íß¿lÿşı\ë&!ëª²2:yò¤ˆ\ÈmJ)“ı\è•=¿!\Ğt}:s³DW‰!\0¡şòI¾Œ\Åb£ˆ`j†`j¦«¶ê¯bö\ég²ğ~\ÕŞªd)arnö*]‡ù\ìoj;ğ<o\ì\É\'Ÿ\\70\à:\0rşüy\Ê\å²Jx–1(Ï¨y\Ç#Š\"\Ú3«\Ì[X\Æ\ÒŸ`\æñÿƒ	\Â\Ä\ÃJs`Jk°\í%\êkö;Ï³ğüqlv•p¢8\æ\Ò\ÌL\â\\¥%5yK\0†ù“?ù“kc\È÷¡uä©§¥\Ô(°7Ÿœƒ\å£	\"BS4viNŒ_\Ñ\Şc„,;U\n¿¯¿V¥\Ğ[\Å)¥ğkU\Ür‰bon¹\Ì\â«\'\éLLa\íJK¶ÀB£Ùµ\"\Ë=»œ„XI\Ò\É;\Ë\år\é\Ë_şòú1‹u¾\×\É\è\è(“““v\ãÆ·ˆÈ¦¬)`e\ãY\ÚH,º>¥¹9L§ƒN43REŸ¡ûŞ…ù¡{˜{òÿ\Ò>s!\Ég•R†*Qˆzî½“\Â\È \×Ë›_K„K\Ó\Ó];–\í\'¿¯¬sF)e\â8\î‹\ãx\ä_ø\Âq\Öh|m5ZW@\î¸\ãjµšˆ\Èû”R> V³ù¸dA;´c\Ç.Pİº½\ë-IºG\Ó{ï˜;o[–$LuO²fªºV#kf“‰¹ùtÙ¥×¥K-oª<`\Ï\Ğ\Ğ\Ğñµ\ãĞ•´nn\ïÁƒù\Õ_ıU1\ÆÔ€\ê8Î†´1`YWc“t=.|\ÇG\æh^¾€[,\"zùVE)”\ç¢\\\å:I©\ÖqG#µŠ\Íh·hŒ3u\îg\'&Yˆ—Fş\î+_0\Æ(y\Ù÷ı\'\ï¾ûnóµ¯}\rHn²søğ\á5»\ïÉšJÈ¡C‡Ø¶mNGö\ï\ß/­Vk£ˆü+\à\æ\Ì2š\ê£;‡h+yU6o¡6\Ü\Ç\Â\é“Ì9\Ã\â…sT·l£<¼	\åù‰¯¾Œß«{\ï\ÖZ\âN›ö\Ì\Í\É	Œ…Ò¦mx#ƒ¨\É	\Ô\ìql°\Øe6$“Œl\\:}Ocş~E§ö\î\İû\å|\àÖšİ»wÛ»ï¾›\É\ÉIÖ¢.²¦q\È/ü\Â/¨û\ï¿ 7\ãM®\ëş3\à/i­u:\ä)+§’\\\×EY(‡ÁB•r±LÏ–A¼R\ÉW\ÎbcCk\â,f~ŒBo/n¹²š\ÃtY\0c	[-ü\á›)o\Ú\ÂÀ\î\â $l\Ô\ë\r\Z:‹\Í:Í°C³İ¢\Ñn1]\Õ\çûIU\Óc£(²Æ˜E\à\ß-..ş¦\ëº^±XÜ¥µ®x÷õ|0¼a:¦§§u†?*\"u]w›ˆl\Í\Æ\Â0”¼^\ÎÆ \Ë\ÊcƒS¡\ä(õ\×(ô\à\×J´\ZigˆÇŠ\Æ\åË´\ç\çp\n…\Äx¿²&‘kÁ\ßr+A³ƒ(…[ò1aLO_/µZ•\r\Í6f›f\Ô\á\Ì\äE\æ»^YÖ¨‘%‰1¦\ZE\Ñ\Çz{{\ï\ÕZ­µ\Íz½ş3SSS\Ñ÷\Ù\Î¢5\äş\èÂŸù™ŸùR£Ñ¨ÿ\Â#y÷1{’\Ğ*›ıR\ê­R\ê\Ãñ½T•	q¢=—¨\İÁ­Ô’´z\Ğ!n·şb›R\n\å@\Ú÷º`†\0¯T@y.n¹@É‚?=G¥T\æ\ä¥s\\™\Â\ØdF>m\Ì\Şi­yg†§‚ øh¹\\>ùğ\Ã¯I]}Íúw\Şiö\í\Û÷J¡Px´\ÕjmF%!i¦\ÖÂW•\áB/ÅªôlD9Q«ƒv]D	Ö‚vZóu”Ö´§\Æ \ê$ª\ä<\0\å860°\ï\0º\ÜOi †WN\ê\ï\É9\ßKF\Ş\0œ‚‡\ë¹]\ß\Î\Í\ÏÄ¡AÄ’x†\Ù\İJˆ¢h2\ã¿S«Õş\ã?şcó\Å/~qMø·\æn\ï\Ç?şq~\í\×~\Í\ìÜ¹óh¹\\şY\àoYk·- c­m+Q=e\Çÿ{\"Òƒµ\"Jh\Ï/\âUJ `bƒ\ã»`m\Òò#B¡oˆ¸n)ö\r¬\Zu¯$\åyô\ì <¼‰(‚\ÆBD±·FFh\×!¨7q‹¾S\Æ\Æ\å9\Ø\Ø \ÊR\é©1\Ğ\ß?\İo=n¬u)Xk€Ç±Ç±‘G?õ©O\ÅkyS\ÌuM.~\îsŸ\ã;î‰‰	\Ê\å2333”\Ëe¹Y|X¹\Ît~©\Ç&¥‡ú\Äå¡¾¥ffW‡1S\'\Î¶;Dó“8ñ,›\ïyW’.y#†=\ë|œj`¬C\Ï\Ö!Á)xÌœ¼@e°\å¦7\ßt4nÉ§5³ˆr´æ‚¹ú/O5\æÿË³¯\ãÈ‘#ö¡‡¢V«9A\è}\èCõ\àÙº¦\ß\ëõ:gÎœ\á™g\á\Å_\ä\ïzWzŠ\îˆT\ì\çE\ÉÖ¾›\Äõ}1qL\Ô	ñ+K³\Ş\Ús±\Æâ—‹„­\0b\r•\á¡\äY\r\äõ)5fZt\ê-œ‚SğĞ®C{¾[ôQZu£|\Ç÷0±!h´Ğ®\ã+×¹×\ìÿ\Üu\Ûş\É|_ü\Å_d\çÎ\æ\çş\ç\ãõº\ÓõuI¿C£|\âoÿ=n\İ{$´ñ\ï‹\Ö\Ş\Ğ\Ş-6:DA@y°&ÎŠSò1A”t6!c\Ót\êTJ”ú–€û¾A3;!nŞ[ôÑ¾\Ã\ì\Ù\Ë{*h/\ÓÚ’x_QLsj\Î*Ï±®\ïa£ıK\åÁ¾ÿ\àV\n\ëš\å\Íèº¤\ßo:\Ì;6¼SB‰‡µ\çz¢$Œ2\Éd”‰*7\Ì·C”£±¼r‰ş›\èß±™0‚ \\1Í´’²×‚vD\Ğ\n\ÉğPB\Ô\n’‘:\'½‘Œ$\Ä\Öğ\ÊEi\Ï.bbE\ÍÎ¤®y\ç\r\Óu;\ï\ÏJ¹·¶Ui…\Ò\nD#\ë»	±Á„Q’5–8Œ8Œp\ËŠz¨m&Œšs\Í\äs«]ª[È²Ô§hÏ¡\ĞSMR3qLFje²´¼\ÒIBR¼¤¯\"JD\á»=¥ƒ\ÖQj-\æ\ß]?@F‡ño¿YJƒ½}\Ö«\0`Á«»\à´\ç\ëIñ)6Iph\r&Š·\ìS\ê\Ç\ë \é‘\Ë\ê*W^\ÒKD”7ôRì­¤S¸©\ç–>GH\î@À)z ¢D©‰ƒ°\ïğ\á\Ã\×E½_¿\nV\0\ë\Zl\Çn\×i\0($§\ß\Zƒv°§\àa·ú€&\r\Î\Úsğª%”\ç{¶SIc\ÄòKv\êD;z*(\'\ï¿X¢ND¡\à\']ŒiR3BLƒ·T\0kCX¦Å²v÷({]ºnRx©À\Ì\Ø,\Ús{Êƒ½{*\ÄAˆW)¶:\ÉIIf\ÒşòXC–€[Q;@;\Ê\Õ\à•Xñ/G\0š!A \ì\Ú\Ò#\ê$y4¼rÒ·%J0Qœ¤YR\'\Â\Ä\í:Ö„ñ…°\Ùş)-zÖ¯’§uu{\ì\ßÏ£\Örÿ=÷Ht¾Pš¿´Ã´\Ú\ïÜ³}§Wò\ÅÚ¤-=Kq‹’´I.I¯c,¢–ŠO™Í°QL†i“µ‹8.q&\0h.tp\n…\ÄV\ØĞ¨\ÙÁ-’²‰V]Ueb³¤ó¬Í‚G6\Û\ãGÿ\àk¿s\â\ë]¸ôJd\ã˜Í»ws\êüùu\ãÙš\ë\Å\Ã\æ‡wY-RaÓ©†~Ÿ5ö#ˆ}ö½\á¿üO>*\Ãva­‘ \ÑÆ¯•\ÓÁ!¢®+\ÚYl\âø	Ó•\ë`\ã8)R\Ùä”‡¡\ØWI\Æ:uD \Óh7\rµÍƒˆVD\æ\Ô¥\r=x\åb¢–\0\í»KN‰„\ÆqL\Üğ«%{ù\Øiû?şş¿¼P\ê«~\Ó/¾¨£ö“³[\Ë\í\áùöğ·¾e#ø\Ídòx\ÍhM%\ä£\Õ\Í\ÜVøkR\î[,–+w\Å-û\Ñ(²ÿ\Ê\Zû³`o\ÃR‰\ÃH&ŸE9šÁ}£Ò©\'L\Ï\ß:)l¶q}\åjš3‹8^z\'8\Ú\Õ\í{(•c\íh\â\Âv›N\ËR\Û4ˆ\ÅÒš«ccƒ_+\ã÷V°‘Y\î\È\ÒM	D)¢v€5\í:ÿÊŸ\Ë\äñ3\ÕBµ|PD>b\Äù€ß¤W`ñô¶]3?Ö±\æq\ës¹=·f<\\@&\Ù@y\äÓ²o×¶bi`\î½n¥ù\ÛÚ†·\Öşe6ˆHv/#\é,4d\æ\ÔE\Ùúö}{*\ËN¨Òš°\Ñ\"lh\ÏMt½€¤cl’t\Õ%N\0‰*\Ë2¸\âh¢ q\ß\Ã\Æ·\ä\ã}œ¢vA£R\Òuw•£1QŒSô0AD\Ô	\î\Í\éyù\ŞúŠ[ñK4\Â&D\ŞÇ…Å¶rÏ¥Ñ±\r\İyù\\\Ó7wšµ˜¡º&@\è\İ\Ì\Üm?6P,Í¿;£O˜8ş\ÇÀ-@IDT\êL‰ˆˆvñ\n>ZkZóu.=\É\à*ƒı`\ra;D{nÁG¢NˆH\Ò\í\â±&qƒ»\Í©§¤ö=¢V@\Ô	qK…n\à\'A£EPo\á}D+´\ç`‚\í$7Ã‰Ãˆ\æ\äÿ\æaüù\×X¼4…vq~ze@!R»\ß\n?\Ö\Ô\á\à…\r\Ãs\ÛF\Ío\ît0\ÓZ¼–^ ?60Àï¸£8Eõw1ÿk\ßHÙ§-®\ï‹W*H¡R\Æ/q|\ÇuPZÑœš\Ç)xl{\Ç~D)‚F‹8ˆˆ\Ã¯\\\Ä+ùK\r\Õ¢4\Ú\ÑK@¤§\\{N2\r¨tí…‹Øœ7eeal\n¯TÀ)x]W\Zk1QD\Ü	ÁX¾÷…G¸ôì«´\æQ®C¡TÌ¼´´Š@RHÀ)zğ³2›Kû¾6a\êñ\ÜÜ›Wa\×\È\èï¿¹Ó²Ÿ\ÆÒ›nR”RR(—¤P)\ã<´\ã,«ò‰\ë\âÌ\'\ê„ônßˆ[*`¢ˆ\ÅKÓˆ$±€ö’4|wô,O2§\È$$\"`’\ì® ˆR´\çÒ”>Ğ˜œ%h´¨ö%\rZ’\à\ÓZ³‹ø•\ã/œ\à™\ßû*\0~¹H±RNU\ãÒ¾³§€dı\İ\é=[\Ê\åG\æ§OL¼i¾i@\ì\ßÏ‘[n‘\Å\É\âı&2… ß•bµ‚[ğ–%ş2“o&\ÈJ¹—dü\Ø)f\Ï\\b\Ó\í»ñ«e°– \ÑJªziaMœ2}\Ê’¢\í:D\Ç÷o­\à\á•\n)\ÈN·y.j¸F<õ¯¢19K¹§Š\ë¯\ØÿŠ®úô\Ş[\"ª{Òª«\ï\í?\npúÜ¹7\Å\×k\nC×•82\ït:(J\ÕÊªÿû)_\Éë¾–’[,0zœ—~‚\Ç~\ã÷1QL©¿†\ã{\Ô/\ÏĞ¯‡\É¢Nˆ‰\ã\îód±t¡4\"Z#Ci Fkv·\à\áWŠi,‘k\r\"É¿´°\Ör\ì\áÇ¸ü\ÒJµJwò*\Û\çj#q\æGp¬\åı»Oœk¸õø›–¿\ãı¤s\Ş6q‚_ú\0q¾¸…¤M\'\"´³ü‡­¤e\ÍrZ\ãøs\ç/s\á»/Q\è©`¢˜­Iy7QU‚hEXoa\ãÇ´f³Å–<.cQ\"c\Z“Iü!i1[ci\Î,ò\Ì\ï•\ãÿ\íq^û³ÿ‹Wôqı¥1†\Õ:\ï¢0LÕ\î^›\ÄÊ•\æ{j²ñ¶‹_ú\é7\Å\×7\È#ü\ÈÁ\í2|\ç\È/ŒMÿ$ˆ¨B¥„Jo\Ç\Z§\íıİ›‹]¥n±²ƒ\Ññ\\š\Óóœ~ü9\Îşùó,\\š¢odn±Ğ#IÊ»\éLyÁ‚F›ö\\8•{€\Ö|B­\Üuqµ\ïBlˆƒˆÿóù‡y\íß¡5µ€\ë»x¥\âm¥+\ÉDÉ¿­XH’&°~¡\Óùk:/?¿0Í›1\îo*Ra„=µ\ÍÊ«¶\ï3\ÆŞ›\î¿¸”ƒJ\\S“\å\ÔĞ¾\Ùô3ÙŒ_DhW\Ói´(õ³ùö›±X*–6/\ÉL!’44Dö|¡\Ø_K¢ö…&~µ”¸¹¾K„\Ø\ØÒ˜œ\åµo|¯\àuoˆ“]{µ½¦M¬\ÄA¤\è³\Ø\'»±A¶\'kŸh\Õô£\Çg/˜3g\Îü…y{\İ*†o\Ñ£·\0¹Á\èÿd#–û7oI\Ş\0\0\0\0IEND®B`‚','Abuelas apasionadas de las croquetas caseras.',10),(3,'Suegra',25,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\â•T\0\0\0	pHYs\0\0\Ä\0\0\Ä•+\0\0\03tEXtComment\0xr:d:DAFkYeWKoDI:7,j:48205749140,t:230530098#c\0\0\riTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>producers - producerSuegra</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-05-30</Attrib:Created>\n        <Attrib:ExtId>06b1af53-edf9-47b6-b9da-5bb7fd8cf83d</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>8N˜‰\0\0%‰IDATxœ\íy¬e\ÙUŸ¿µ\Ïx‡wï›«^\Í\Õ5uW\Û=¹cw\Û\rf°\rvÀÁl,E@J¤D)Aƒ„2‰YI$04Œm°\Ì\ì¤\İ\Æv·»«\İóTóôª\Ş|§3\ì•?\Îp\Ï}U\ÕU]õ\ÊU‘jµn½\×÷{\Î\Ş{\í5ı\ÖZû	·\è¦\"¹\Ñ¸E£t‹!7\İb\ÈMF·r“\Ñ-†\Üdt‹!7\İb\ÈMF·r“\Ñ-†\Üdt‹!7\İb\ÈMF\æF\àú\Ğ\Ó\Ó{&oô@\Ş2¹7z\0\×Fy\à\ŞF½»Ò»›„Áj²\Ú\ïv»‘0‘NOL%65‹]@oôH¯”ş?VY34÷\Ëö\ÍG>ò\ë ô¾ªzÀ×º½\Ş/-¬´¯u^ºÁc¾<97z\0—§ƒ@W ^÷~‹¹\Ía\Û3ƒ_¶ªa’¦\Í8\Û6µ\Ó\"rw\ài·ôTxe\r,|˜8ú-ŸÉ•\ĞMËmÛ¶\É\ÊÊŠ\Ô\ÃFs¼\éÍ¢i\'Nc%—ê½·mvC“üÂ«ª“¦©‰“DP\Äq£ª&MSTuÌˆ|o«\Ù~÷\ì\Ä\ì–Zm\Õõ\Üd\0[»q2®0ƒg:J7¥\Êz0|\ĞDû\â\éÁZÿQ…Ÿ0\"[TøóN·ó\én¿ûZ½\Ö\Ø\ß\ëSÕ¦iº9MSDD\ÇÁq²=¦ª$q¢\ÖZp\Ç:ƒˆ¬\0\'€otú_>zò\ÈM¥\Çn*†´›m3V›®\Õ\Z? V?aŒ\Ü\ï8W¹dx^Uß–¦\éxš¦\"\"8##\ÖSš¦$I¢ªŠ1\×u\Õƒ€ªğ©\ÃÇ‚Ÿ\éEGlv\ëO7\rCö³_\Òm\é»Tù\"²\Çu]1\Æ@eŒªªiš’K„q]W\Ç\Õ7w¢T•8±\ÖbŒÁ÷}EP”£V\ì{Õ±\Ç^~ù\å›\Â»i\â-lUİ­ª»=\ÏcŒO\0I\ÓT¢(2\ÖZ\ãyñ}\ß÷%üÀ\Çó<r•DuŸ‰\"R~n­EU%w„·x©ûQc737`\Ö\ÒMÃu$€H±°ª¤I‚\ëºø¾1&[`7SS\Æ\×Áó=üÀ\Ç<\\\Ï\Å8\Ã\é\åª\r\0kmöÁMı±n§\Ûú\ÖN\ï\Òt³2\0Í·qj-bL¹ Uf\Äq\Ì`0\ÈTRj\n[\ïû9ƒ|·’! °¯Q\ë|¤Y\ßl\êõú·v‚¡Ä]ÀG\\¶nı^i6›Ò™\ë\\òjkm\É\ß\Ï\×ZKÅ¤IŠª’&)Q1ˆI’ ªˆH)Q\ÆD$W[¥^sù©-›\Íô=÷\Üs\Ã7\è·(iu /ğ2=~¾Ù¨9\ëµ\Î=Z}\Ì5ıt1]øNpø~\×u\ä\ÛYUQ\Õl\Ç>\Æ1™\çgnÕ¢©–\Ò$Hö¾µ\ØÔ’&)(¥ú*¾\ç8†\âÀ&ƒ~\Û\êJ\ç¹n¿srrrR:Ko\ëI\ß/kz|o£^o\îj\Ôw¢òˆÀƒšE\×-`Ue…£Ö¦DQô¾ J†¤iŠ\ã83Œ)U“µ¶pi‡“\É×·0\ä\Å\ËCˆµI’\à8.\ç\Â\çR\à\à“‘}ö\Ä\é«KËª0\r¼–_³8|]\×\êº3$ô\Ã`\ç\Ö]ÿÖˆù!\Ù$FŒ1†Ü¥\ÍÔ‡\Õ\Âû\Ñ8Š\ã:\ä^iš\â®\ëGñ#\nww¸\Ñ\áb.°1a\îõ{=úıÁ\è÷\ÍU´\ëy\Ş\×ã¼¢ª/	ò¢Š¾º¸¼¸˜¤Ûºk½g\×úışu[¯\ëÆ\ì$ğ“Ì¦ÿ4‚ÿ\è~hr.¨*išb­-\Ü\ÏB5)\nI’ˆ\ë¹\å\âú¾Ÿ1!MI\âU›©&ÀZ%µÜœ\É&÷\ÑĞ¡c\àû>a¢jY]]»ØKI1\ÆHXUDÔ¦VTµœ­u\×~ö\Øé“¯Á\×v¹n„}\Ûö\İgEÿ¼Ş¨\ÏcH\âD¬µ\Ù\"U6ra\'c†)\Ù}\Ç!Š\"¢(F€\Ğw«ûLl›ª³}²É¶©:suş\â\ĞI>óµ#X«SPT3\Ï+C<ß£\ß\ë—\Ì\Î~SH\ã8\Zn¦Öˆ£XU\Õ_:»\Ğü¡f[ùÚ†“×…!÷p\Ä\Óñ\\\×\ï=ÁCa-4¹\î/\rµµ6w?5\ÜR\ç¯W;™ó{·ñ\à\ŞifZ!­ºO\İwpC)\nV•/<}‚\ßù»\×X\éE\Ù$ó{ú¾O¥a¿Yk‰\ãU\Åó<\\\×\Åõ<T­¦I\nhj\á\ÂZğÓ§æƒ•3g¾²¡L¹.^V­Y«%ô“\"ò‘Z­fr·T’$!\ãr\Zc²`\Î†A[¦\ÊJ©QU’$\áÁ½\Óü³÷\ßÁö\é&­šG\à:S†#}ß–»f\Çxñ\Äkı¤¼\Æu³`Qmn{Œ)D¤¤j¬R\Ø:kS* L\â$Z\\\ê>1ˆÎ§¹v\Î\ßõ¥55şPıy\Ïó<\Ï÷$‰©zD\"‚\ïû\Ô\ê5\\\×%I¢ADE$9Cª¯é±€õ\á·\Ónø\å÷×¿Š÷\Ú:Y\ç¾\İS<wl‰\ÅNT‹®\ç\ÈKH¤1™k\íºnyOµŠ\ã:RDù‚\Ü\ßn˜ó‹óOo\äúmt\nWšõ\æ^T?)\"0H“TÖ»§…dˆk«k¤\ép“IúYUZ5Ÿ»vNğ‘‡v17Q»²\ä¬\nÛ¦\ZÜ»{Š7Î¬–8W•yªŠ\ç{\ÄQ<\Â«™ıÆ‰…#\"ˆ\äBC\Ñ=\ç*7ˆ6š!\Ú\Òñ9\n\ì±6-urA¾\ï\ãº.ı~„\naÏ¦\ß>Ëƒ{g˜m‡8f,¼‹§–CG#¥›½\ŞE¶\Ö\âz.q4\ÌH¦I’K\ÏúÙ•ÿ*°§òY˜\Ù\Ğ$\×\Æ9¬\Úó½ ú\Å\Ğ?Š¢²\È9_Á8?ğ±\Ö\r¢\Ê)\ï>°‰\ï`·m\Z£\î;äª¾\\\à+aF•Î­8v¾SB&U	)î›¦)A€—yXEœ³>¿Rµi\0Æ˜¯/­^„ÁU.\Ô\ÅiÃ±›\Ãffeö\Ë\"\æ7¢(\Öb1T³I…aˆˆ”A^A¡\çò£\ì\á\à¶67ÊŒ\ê\Ï+%\áôR\Ş y¿`l¹À6Ë•@¯cJ\ÓL²\ã8\Î]\î¨tH\â8F\á3\ç_[•«]ª‹\Òu\ÓV¢¥¸uÕª}*M5Æ”ú\Ê1jµ´)¥\ìœi²m²\"¥±}«L¨’ªrÇ¶6û¶´K¯\ÍZKšyL#÷O“lñ\Ó$û\Ìó¼©,‘c?Ë»\0$q¼¹Yknøú]†\æ0\Í\Å\Æ2\ÈŠ\ãd\à8NÉ8‘õ6A\áÁ½Ó¸®\Ù\ĞÀ(ô>ñ=\Év<’‹Ğ¨šŸ\ë<6\×s	Ã0q+(q1^\×u±VÿÁ>ÿ\Üvl\àˆ¯#ü>Ì‹Aˆˆ\'FJ`µ0ğ¾\ï—\×6B—w\Ü6E\×D\Åó\Ü;\Í;n›\Îb3eS[Ifùx‡\ç{yL\ä\r¥Á÷ñ*®oq\ëLÂ¸}m¢óŞ£\İ\Ğ\àú:0d†Vk»ŒOŒ·\Ä\È÷º®+üV™\Ñ\Ó\\]mŸª£¼u[q9²\n?òğm\Ô}‡\Ôf]a\â(&\ä¯({EQ\\\ÆDÖ¦\ä@\çúÛŠˆ¸˜Ÿ ±a\ã½ñ%µĞ­}\Ìó¼{%sæ‹‚…¢<1B\à¤ª\ìŸkúÎ†\ã8’\'÷Ïµø¡w\íf\ëD\rlB¯×§ß\È\ê¶F¡üÂˆ\Çq\\º\ä\ç\"fM\Ëp¶»`\æv8°aC\ß0··\İn³}\Ëö`uyõ\Ñz\èüK\ĞG¨ Uœ*c‚0\È\Ô\ÄÀ\á\é\Ã\çY\îÄŒÕ½Êœ²p<r5ôƒ\ï\ÜÅ‡\ï\ßÁbgÀ\Ñs;¶\ÄË§–9q¾\ËR7\"I\í\Èõ\"B\'¸N&É\ç\r¢\ÊÇ¢8µx\Ó\Å!õ°n6O\ÏHög\ëa\ãCˆN\0\"šm£\Â[)½š¼”\Çq‚0\à\Øù._y\å,\ï¿gV•(±=\ßÁ1†­5|/C€m_!cr4¿Gğ]‡Z\àñ‘‡vz«ı˜\ç;ü\Ú_\âè¹µ‘¸(I’$Áw²\ä˜\ë¹E\ÊXA8n1§¹\Ù\"õv«=c0¿	¼Sr¿(™VIœ”.f\'ü\Ù7Nğ\È›˜_8½\Ô#J,\Ï[b¥sp[›ûo›ds»–£º\Ãù¯g\Î¸”kı˜\ç/ó\ä¬õ\î\ØÒ¦7Hh.;f\ZÜ·{Šİ³MÏ¯a(\â\0%Š¢\Ì\Ş\åX˜Mm\á«À³K\ï‰à±XF`CòQ&\Ú/< ©½(Ä „\Ù*b‚\nµeŒÁ÷\\Ï¯ñô\áE\î\Ú9Ám3M¬*\ß~p‹ˆ\'^9\Çÿü\Û×±ªÜ·{’ûwO2\Ó\n\ŞTRºƒ„O­ò\Ä\ËóœY\î³wó¸{{65\Ëk¢Ô²Ú‹$–ñF\0\\\È\àÂ¶^¡›£V¾¯\\ó\nV\éšR¿â‘}ğrÉ¸€\ëÁÅ‚Šk¬‚c„¹‰\Zu\ß%É£e›*\Í\Ğ\å»ß¾™\ï¸sg—û|ıy½c®#\ïü@¶X\Çº:²È£7±gS“\ĞË½¼Šk\íˆ0^÷qŒ°e¢6\âT÷tSÅ¿l\é¯YI^€\ç64rù.™?y»¢C™ +Ó¦\0Iš\ÄC\Ø]Uñ=Ÿ°”J»\æ1\Ó\Ê\Ş[Ÿ*`r†}x2³3E@‰h\åº\á7Ìµ80\×B\Ş<¼¬*ãŒ1\ë/u\'Ë›0#ó‡,\r\ÖÆ–\à6\àõ+_²\Ë\Ğ5º½A«n? \"s‚ˆªJ•q—Ì€Œ!AP«\×1%3¬U6\×hn‘\n/I\Éíµ¨\ÍbD³ò\Ü\êÅ•}ş#Õ¦\è:•9ò…™Vˆ\ëHù½<‹‘Ñ‚Œ\âQ\Ö\Ú\Íõf÷½¼k\ë†z\ë\×$!;gw† ?¢ª06¬†®¤ëº¸®[–\ãDƒ\á\çª\Ê\Î\é&ŠòÆ™e\æ—\Ö\èö\ÄiÊ­m‚ \ÍüòYL\è°u|m»J-ÚR¾@Ç¬$GW\ÏcDqm¬±¶’²¸\Ò\Ã÷=6OŒ17Ñ¤]i„\ç§Civ§„V`„!Xk]c\ÌOÏŸÿ\ì¾}ûN¿ò\Ê+¢º®ZB<Ï“f{\ì=À\êûª:ÂŒ¼\Ú\ÏË ŠõH¯ª\Å7–öL¢\n+\İøô)\æ·=L\í}ó…ğ{\İò\É\Ï™o[\æÿ\Æ6\ïª\è{E\í…YT\ãz\ìû¾Œ|\Ï,§gø\ío,ñxœ•wO\Ò~\ä\ãü\ÍÙ\'_=]Ú‡VÍ¥÷g²/Ÿ”\ë>km\æ\Ê#wˆ•Ÿ={öj—ñºj	i7\Ûnj\ÓR\É4HÁŒ*%œ\Å\Ï8\ZFÀ\ÖZ4ù‡oopp\ÖÇˆğ\Ğş­t\Ãi¾\ï\'Š.‡ù\æ§›/~ù³l\İ9…¸¬‰il\Û\Çò\â\É<x‹³\İl\Ò$\Æq3\ßÂ­Ñš\Û\Ël²‡3KÌ¡R\îyo‹M\Û\ê|\äÁO\Ğò”­\'ÿ/cõ ³{*#\Æ\Ûu]JuUÔE;„ ¸ùÉ™ö\Ì\ï\íÙ³\ç\äSO=u\ÍRr\Õ9u«\Ê\Ä\ØD\rx?\à¨ªT\İ\Û*tmœQfdW\Ì÷\×øö\İA­N­1Fgó÷/£½óv¶oİƒ†\ç\Ùyw\Äı\Ìñ¾;ÿ9s\Í=ô\æ\Ó;ù*bñ dÎ€\æ÷$h\Ò\Şs?†;qœı\Z¾\í\áûxdÿ¿ x|ş±\ßeÜ®01V\Ã\áë¯Ÿ\ã/9YÚ{s\'/t°e\Ç1\ãpĞ˜cœm\é =\æy\Şjš¦Qœ¬ï‡¼rºƒt¸“;n{\î×Ÿ€²„FEò$Ã‘!PFÀ\î©ó\Ñ;3ÿ¿Ùbfûm¤©\å\ìr‡¿}ù,w\ßu7›&Z8ºH\Í\Ä4\ÜQg‰şòA½‰q:\Ë4\ÚY?z\ZG ‚\ãzºk×£61‹qC\æ»gˆ¥M7ry\æ¥×™‘5\î\ß3‡c\"ğóŸ~Š\'_?1YF¡®|\ßGŒ”›©»\çyx¾§j3·%¾ü\Ú¯?ÿ{7€!3\Üw\ß\İbû\çv\rúñŞ•¦©\Äq\\B\í…ığ\Õ\Ì\Ğ\'qLœ$\ì\nù™‡\Ç\Í\Êtü°\ÎÜ; /rP+¸Nş{\Ù\ê	h\æ\Ú.tgyúX1NYlW†C\ÂH™Oikó\\½ò\Ò\Éş\Í\ï>I?N\×5ş¥w…\Ò	eúÀó<4£\Â\×W…—º\Ñ\ÚCG¹hy\ä\å\è\Z\Ü\Şyz\ê/õ•#»ü; w\É\Ö2º£\ÆŒ+}Ej\íR’\Ò$\"\ÍE]ŒÉ«?ò\Ï\Ëÿd\Ï@V·k+ªªDm¤À°F³¾¥e\á„\Ã\ç:N?NGT•ªfQ¹\İà¼«·|VşU£¨\İVó\ê÷\Ã÷\\\Õf¿fø\İqşJ»i\ç³Ÿ•J”V\ÄEŠ¶|`Î¥n\Ä\ë«\î\Ğ\ÇOS\âuAqŸ\Ş+\î\' 6\Å8\îo—\ë;,\è\äb—\'^:SÚ»á¼œBò¤š-³¥¤	£\Ù\Ïlş\rD¾sË¦gM5	w¥t\ÍYYYa\é\ÌR\ËBŞ¥TˆpY\è¦y\ÉhùP\ÇÁªòø\Ë\çp\\§¬£Š\İ\Ë>o\ËQ\ãAwmX)m\íH`x9ú\æ±E\ÖúI™G/\ì†\ç{¥İ³©%³Š”²€®\î\âY*š\×\Öğ­[¶Ö¶l\Ùr¥\ËXÒ†$¨Üº\ë\"2ˆëº¥\r¼´F‘aKZ\á\ã:º\Är¿¶”¨\×-Uå‹K~G¤qLkj–\Öôfjcm\ÂF7¨\Ñ\ï®] 1%Iù\ÌM\Ôqò’Q\×u	‚ 4\âE]‘\åF\Ô\ÚÈ½²)\ä ‚N?¹\à>|ø\Ê1§\r`\È¢\í@„60bE«…»˜å±‹x\Äq:ƒ„¿yµC’ó$\ê%¤ºûÖ“ª%\îwñ‚0S)\Ñ\0k-I<\0µ¸O4\è]ô»U;„\Â\ÌXH\à9ˆÉŠ”\ÑÀ\ÖZ;R[¨µ\ÂN“¤2\ß\Ì\Æ\ÇIüù~o\á[m\Ô3ò<O\\\ÏõUµY€I\Õtm±›Š\è¼\è–õ<À÷ù\â«şø…>½DI¢[)z3J¢«‹óÄƒjS\â~—$\ê³<’\Ş\Úr¦º® ‘Õ®ûŒÕ¼\Ü{£¬Õªz*\Õu‡j\Íõ\ÜRrª­\rIšvE\äO\î\è\Üq!¼}t\Í©\Õ\êµ$¡¢E~\ZònX\Ç-\'\ZG1j\ËòŸ·|õD\n6!\î_Şˆj­	\\/ »º”\Û\r\èwVQU‚Z¿V¿´Úª\ßw˜\Í_0\ZŒ\Öƒ“—¹š\ÕsUHmj5M“£\í¥\Ö\ãÏ§\Ï_UÔ¾F]\Ó\Ô6U™TU)ª\0E¤4”U*£\Øa¢#B\ÑR¾ºx¶²\ã.=\'\×ó©5[´&g\é,Ÿgu!Ã“ZS›ğkuª…\ÒoF\"\Â\Üx­|C˜¬)tDÚ­µ%“ª.pñyœ\Ä*\"š®¤½ğŠ¿®™!AHÍ¯}DU·$IR&§\\\Ï±%Õ ¬x¯ \ênöÿİ•e\İ+W¿\ÆqhŒO\ÓhO6Z(:¢©.§ú¬Z\î\ß3\Íd\Ã#DYEL\îi¹‹\ëÑ¥j\ß\ÊúÒ ‚Aóg9K‡«\ëâ½¦şG}T\ê~c—M\í¿O\Ót6?FŠh· õ0¹\ë\æ\"ŸtˆÀ[f\ê&kEHê­‰†V¿¦\Ê\ÒB\Â\êrŒ\ïg^R§“pôõƒ~J½\áb®°j~\Çtƒ\î \æ™\Ã\ç°9ˆ˜Õ’\×iW(s$y{öğ%<\ï…iø»Sñ”=\Ë[G¯\Z\íİµk6Šˆñ[k÷\ÒQ\ä=ª-³¤Š€OQ’$\å‰cû¦j¸úºkK4ZS”=\0\Ãy\êÄ€c‡;,\ëa­¥\Şp	C\ÃòRDYD`fsı\ÇŸô\Ë\ï@\é\åø\àoŸ?\Å\ïùu\â$\Ò2 „\ì\Ä\Çu\Ñ8.“\\V—\Ü%\Ï#y#\×u%\ã\âIói\Zı%Fk‹®€®ZBv\í\Ú%ıóK›R5ÿ5\ãI@×‘0K—±\nqˆ\ë\àû~y\ndqJš¦œZM8\ÓQŞ¾\É\Ãˆ}\Z\í‰2}š­\"¼öò\Z\Ï?s\Îj?O\á\nI¢ô{)`prU¹¶q\êX—f\Óc¬\å•c€Q\æşÕ³\'ùÔŸ½@œ\ÚÒ¬ã”±’\ã8e´}–¹\ì\Åi:\Ì‹1Uõ\Õ&\ß\Õs;_Zë®x«\ëz\ÕñğŒ\ã\Ö~\ÌZûƒ\ÖZ#\"\Òh6¤h«22\Ï\Äó¼²:0o®øøpj5\åÈ²\åÀ´oP¨µ\Ë{XU\æ\ÏôˆŠ\ã\Õ›MüZ\r?	jõòw\Çóó\\»e¬\í19\\0ş8µü\ÑWğ[ı2qQ$\'™Jr‹XJ\×uÉ‹\Ä¬\Õ\Ì	\É\ÄjiPœ\İ\Õğ\\\ï\ázX{b¥³rú­¬\ëU3d0d¢\İ\Ø)\"J\Ó\Ô$ƒ‘´,\äŞ–ŸÙ”$/ùW²rÒ‘V¶<P›\ï¤Y²\ìšğ´GPk\âú\Ã\éÙ¹­u\ÂZ@?ƒã˜¼A3S‰õ†\Ëö]uöc\ÓÜ…­p½(\åw¾ô\Zø•Ã™d\ä_ñ*mYû„)O(\"÷¼½­t^\Ê†²qŠ1¦øÁ\Î-v_½ğ¼\ÈK\Ó5À\ïd\ïm:\í\á~5I’I’H£\Ùl\Å%ôüa¦°`V5¾T¡\ÛT\İ\á÷6x\Û\Ö&³»\à8£\æN€ş@ô\×yQõºÁó@«u¨9-w#şó\çŸ\çk¯Î—c%¨jkD¤\Ì\åã¯¶\ç•	¸ÀÇˆ)‚H%S¦Ÿ_Zu>~jş\ä*œ¿\âU½/\ë<\îZo¢5y7pWš¦\â#®\ë\ìüB¬‹ ª\ØaÅ„\ÖSñ^/V¾~2¢\æ([›š\å<\Ö]\ïºB®{tŸ\İlô¾/ŸZæ“=\Í\'–\Ë{6¡ *CŒ“°E_{aS\Ö;\ä•5Z\İ4‘?\Ù—\×Î=ò–Võš\Ü\Ş4fv|\ÌÃ‡­µ®*\âû>q\\ÁwÈŒyÕ¶¢)W´ˆ[\Ô*Ï9»\Òeß´\Ï\Ø\Ø\Øğš\Êu{UI\Õò…o\çSöó+ı\ìè¬÷±Ä¤²ù¤#\Í9®\ç\"\É^%µ9Œ¢\"’Šğ¿\ëcõ\ß\\XZHVV\ŞZ\Ë\Û5ö©P\Ô\èZ#\ì|07PJu\0\ëb+(ñ¹4šCÀş\Ør\ÂVg‘™¦G\Ø\r*/\Â\Ô\êB\rz]N¼úÿıÿ\ã\ìZ1®\Ê\Ø\Ç{«İº®ç’¤IY­X}f5‚/n—GóQj“_yñµŸY^^¾ü®£kŒ\Ô\Ón\ß;<¾>\Ó6j\ÜG#\Ûr\Òú\æ&Lò´Ÿ\0I\Ô\ç\Ä\Ë\Ïrü¥CÄ•\Óx\Ö\Ã¥Kk-§óú3_a\é\ìI°†¥$\æ\ß\Å\Æh+m\n\ë™RÌ¹@¦s\Ï\Ò\ÇÊ–v½}c2†\İ\îExFO@X¯g\Êd«·\ËS†uy&+ù\\<s’Wş2§•j¯`„ˆ F\èwV9üÜ“ùY\âhÀ\ä–Ô›\Í7{DµLt\è5\éğó\ÆN%&\ß2ñ3\ì\Å\\]\Ğ}\Í\Å\Ö6\Ñ~dƒM\â„ Fw®U\Ä\Ë«ÿlb¬ıf°€cÀw\rY\Ùy½Ÿxõ9\Îgl|Š°\Ù\Æq]úUº«Ë¬.Ì“&1a½É¦\İûiM\Î\âõ\ÉüY\Ãûğzq°\æz)±š=\ïR’\\z[*\Ó\nk\ÓÓÁ\Ä\çß‚‡À7^{Avm\İ};0b¬\ÃWñ\Ñ1\Æ!µIùy\æm]¥6\"Ô›\r\\\Ó#‰#\È%¢»²Dwe©\â´x\ã05·\Ù{ğ‚,ñœ‹+ƒ\"\Í\\Œ§p¸\0^¿€ª¹}²QôQ>{|p<\êsñ$Ù›\Ñ52¤F³6\Ñv“¥.\ËR\Ï\ÏZÀª‰c)£™·ô\'\Ãe”zup\Z††\ÓÂ«7X96K÷’ŸŒ¢Z\æ>\Â\Æs»0613¢j‚ñ!\îTõ˜\n))REgW‘\í,\Îp.\Ü:-‹:)\":v¾õ\é\Ú`Á\Ş\0†\ì\İ:™­‹Šˆ\r¥©z#&¨­f;¹ˆŠœh\Ô\Ö2¿´\åÅ­+D013\Ç\ìö=,œ:\Æ\ÚòƒnÖ†6\ÆhNL1µyâ˜‘\ÕS…\í\ïğhºº\î9C\É.l`)%•z°õ\Ì(\áv)£(//¯.ş\Üı\×.,Ÿ¹BºF†|Saú,ÌA\Øa*\îc¿\×\Ï\Z%£\Ïó†\Ç|ş\Ã\Ò\"qœP5\ÎM\íWföDg)2¸\Ï\ì=\Ìr[^“%˜\ê\Ù$¥­\âi	}\Ö8ô\']t\ÃUØ´*C\n)©rÉ³¡U\Õ\\\ÚuX\á¶õ¶Y`\áªk|¯\Ù\Ë:·xn‘¬\É\ÎKi*%@9Rš&i\Ş0\É\È	Õˆ`Œ3R†Ù®\Ça\ëC)\ï²\â¦øA­Äµ2Œ\ã0cxªk¤¨Ó·ùl½\Ç\Ë\ï_+(¸\åivCi.Ğ„\â÷¬U:\ë]/¨`J\íf¹»ü¹CÉ¡·¹WiªNv³\Ö>rRD¬\çyš\í\Ì!Íz\Ñû\ç8VqfVQq^œŞ¦ªe\Öo\Ó\İ)Nh#Z56\ï:04^.B/\È	Š1Â®wúxµa\\Œ”§d¯_\ì\ì=[\ä_xµ%†•Ÿø—•†\æ\Â6™·LÀ7´\ß=ş\ZğWd9õ<Ï’UÄ¨ê°œ¦0ú\Ñ *\á•b1ªLß¡Œ\ïJ³¢„N ÷\ê4¬EI\ÉW^M\Ø÷>~CP­V¬\Æ!\ÅûEz h©‚ <\ï«³(p0\Å5¶t\Ä_·ßµ3“\ÓÏˆHLˆÈ¤T¶«ˆHa4‡\Ç5eY6#¦L™Zkq\ë);\ßc™¹3AœL%4-|\Ç\ãNg&«û½L\ÜR%R1\Ï@R¬M©O	Ó·y¬\ì`ˆcjªP§\Õ÷Šz²õ$R\ä\ri¶[\í?9sş\Ìñ«_\É\r<sñ\Üâ¹¥^¿÷7Q²ù3õ0=\ä©;3\ëºn{FUc2cœŸö\É\ÄŞ„\í$4f‡…\Ôõzƒz\Ø ±)d’P²{¹`†°ÍªF|“ó$(©M±VIz†s/*iª(¼&\×u\Ë1VŒ‘¤u*²0\àµz\èÜ¢~._\Êt)\ÚĞ³N\Özk\é¹\Å\îñ\ß8ø¿R™øA…_¹dh\Õc\Él\Ë0ş¨Í¦l~`€ß´ˆd’Ñ¨7\Ëó©\"c9d\Ïp¥8\r\á\áñôñğlj9ş5K”††»¨ƒ¡SRU_\ÅX«\ÉOW ƒ±\Ë0ş–\Öl=]‡\Ãg^\0Ó¹\í^\×o\Öş‹O\Ö\ÉOk«\Ö\\òN=e\îÁ\Æ.¢\ç\æ}\Zd©\ÛÀy:=Í¼v†\ß_Ã°\ê¾\à\Ç!{–Wt\ß\Êøg°ª¬:CYö’ù@]±š\ÛÆ´\Ü]\ç-\ÊÏ¹¾ûğ\êU»¼p‰İµv\ì€G\ŞN\'v§A°¼\Ö?o>(¯ø›Q….ö<K\Â\ÜC=j³YI\ïù4\êM@\ÊXÀˆ†\rÉ€E\ÛcŸ™\Ä\ÅÉ¥E.hY\Ô?­küyú*®\â¹ƒAP\ÄMi\Í9¬‚¸I\ãTT)\å\ì\Î%ªk\è |QS¬™Ì÷¾Â¿n7~G§O¿¥ú´\á‡`\Şó\èL\Ğ\Ø\â\ì8j\Âû§7¿şA»Iß­6—^õ\ÅIœ\Òk)š*k³­\íß¯\áy>\Æ8yô;< ³8\ÛZ\å\Å\îiºõ˜	©1.[¤\Ån3^*²1\Ç\í\nG\ì2¯Dó,\']65\Æ2T‰››\áÀ\r\Ï.&:7j\Û ÷´|¯\Ìº¾°ó]Æ¹İ„kgô±³/jºtÄ¾=\î\é\ßOş[¢ñ\àé§¯ı\ß\rcÈ½¿\ßİ©\Ë\ë¶ş\Ë}µß¯i²\ÄATf\ï\ĞÜšpş9Ÿ\ÕS.I’B’¥H%ui\ÔwÖ®B\ëV-½^‡ó\çh6›œ\Ö§s\ÕU\ãó\ŞÆ¤d \â_^\ç\Ù\è4^\àƒ£tW:,./\Ğ\Zk_;©O\Z\ÚÛ¡»\àŒ¸\Ü8\Ã#b\ã–\ïv\Øt\Ğ\ïkm•÷µ·\Ë	›:\ÏDGO}.={vğ\éOo\Ì:nC¶\ïAN|sK\Ë&ıF\Ø,\"¢d|K\ÒØ’Pßœ\Ğ?p\î›\Ë\'²ÂŞ‚CwZ[)!\r\ÕQ%¤ªœ[˜§Ñ¨\ã8ƒ~P|? g¾’\çı\î^\"R\Ëj\Ş\ß1`0ˆh6\ÇX\\Z(¥a˜\ïp¿N¥8hÁ\Ş\ï48~%\å(µñu\ÖÜ²ED7Õ·M\ßû[¿zö%\ÙúK×¾fC¼\ÑÕ±»ı\'‚tD†\à¹µ°Ak6`ö€CsÆF™¿ğ†’ 1#g\èõx^\Ös\Ş\é¬aU©\×¯Gè¬­\áº.\Ë1\'Mº\Ä<™œ\ÊÎG©\×\Z¸n\Ë,.-”G\Ôª\ë:¬\å\ã™Dcp\àƒ\ÍM‚Wgø\nGx!\åK0*Î«\ïüFó¯ù;8ùÊµÿ]‘\r“—s¹\ë{%,\å\Å\äÃ°†\çú\ÃÀÊ©½\Â\änk3É°•\Ò%U[~wuu•4Miµ\Ú#\Ïs]—\æ\Økk«8-—\Ç\Óc’\å\Ç\ÕüŠ\Ç\äyõzƒ\Å\Å\Ú\íñ<÷‘ @{›Á\rR\ÄÀowhL_:__¨¼ò \åL¼}~ö>:\ç€\Åk^\Ç\rq{\ßù(<òh\ÃQ\á^ \\‰\Â¸\ÎhJ· qÀñÀ\rÀof¿W¿·²²(\ív»,œ–\n\ÄR”ğ$IÌ‰t…\Ãv9oÌ¼0V©\Õj´Z-–——ò\Ú*@¡¹I\ØzŸÁ«gz±\êübL0z\0€(\Ü\Ş:ñb}õW¿\Ú\å¡\ra\È\Â\Zœ[!T\åN©dŠ·1E’jˆ½8h­²¶¶†\çyŒµ\Ö-\Î\èB\Õjuz\İ^VªC–[¹T \çy>“¬­­\Ï\ïR\Ør¯¡µÅ”ù—7C\â8\Z\æx²·¦Te÷û¿pÿ5aXmC\äÇ \İ\ëªz°Z×£ª%´ıA¯+\ïò\Z£^¿º\ÍJI\Æ\ìÁ`@¯\ßÁ›ª™Á‚Œ1LLL\Æ.l\Èdú&\ËZD\ï•g€Ş¾4¾ûšÂ‚6Ä†|¨G%ğÀş)Œ¶.9f\Ø$9¸’\Ş\í\âšK§v‡”§Ó©\×\ëôû=‚üÜ“õ\ß\æY2u†\Ã\ëT¯6üıR”Ÿq22.UµFeõ­_~\å/;½7¥\r³[´qt‹!7\İb\ÈMF·r“\Ñÿ†ğz\ç“c\Ã\0\0\0\0IEND®B`‚','Como las abuelas, pero con herramientas mas modernas.',100);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `idRanking` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idRanking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards` (
  `idRewards` int(11) NOT NULL,
  `nameRewards` varchar(45) DEFAULT NULL,
  `descriptionRewards` longtext DEFAULT NULL,
  `img` blob DEFAULT NULL,
  PRIMARY KEY (`idRewards`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fullName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `profileImg` blob DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'jaimefdez','jaimefdez','Jaime Fernandez-Bravo Carranza','jaimefdez@gmail.com',NULL),(3,'silviarc','silviarc','Silvia Ruiz Carrasco','silviaruizcarrasco2609@gmail.com',NULL),(16,'testing22','testing22','User testing','isthetestinguser@gmail.com',NULL),(17,'testinga','testinga','User testing','isthetestinguser@gmail.com',NULL),(18,'testingaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(19,'testingaaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(20,'testingaSSaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(21,'testingaSASaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(22,'testingaSASaaaaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(23,'testingaSASsssaaaaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(24,'testingaSASsssaaaaaaa','testingaa','User testing','isthetestinguser@gmail.com',NULL),(25,'JamesTrun','1480Rabos!','JaimeFBC','jfdezbravo@gmail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14  0:37:37
