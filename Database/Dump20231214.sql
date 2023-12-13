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
INSERT INTO `producer` VALUES (1,'Cursor',1,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�\�g-\0\0\0	pHYs\0\0\�\0\0\��+\0\0\0<tEXtComment\0xr:d:DAFkYFr2kIw:24,j:2064167642558949265,t:23061116:;N�\0\0iTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>Panel de Botones - click</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-06-11</Attrib:Created>\n        <Attrib:ExtId>f191fe71-d423-41fb-9199-3941a6b8b176</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>�\�)\0\0IDATx�\�y�E\��B؟�?�\Zh�Y\"[�&\�K \��1hXT���ˇ\�S\nA\�\Z$\nH�b\";�/s� {��\�ՙ;�\�;sg\�:\�\�\�vW�\�s\��nUW\�9����\�o\n��B�-�`AK)X\�R\n��B�-�`AK)X\�R\n��B�-�`AK)X\�R\n��B�-�e\�Zo\0`_f\����\�\0\�\0\�P�3?\0`�1\�V\�Z\�8�*@�\�(f�LDG\0ئ\�\��K��2\�\��F\�W\�|�&@k\�D\�\0֪(Z\�)\0�\0�`)\0��`dE�wE\�\�|�s\�\�\r5��\�4\\�J��D��e�\������{�ss�]��&0�7\0�\�b\\\�\�\��kc̿\Z�\n\ZJCh�ݕ����?5_DNa\��s\��^Z\�u�\�Dt$��*�g2�Y\�[��G\�h�=���DO��7\":\�9�\�`\�W)5��\'�X����\��k�\�9�\�`\�S\�\Z\"@k\�Dt#�Q\0>����T\�\\\�Z��!�\�\0lVQ����\�\�t\�}T��ԝ�Pk�>3??�\"\"��(��\��IQJ���f\�\0��\�7D\�\\9\�3�Q6��\nP)5BD�N\0 \"\�FQtv=\�Q\r��\�\��S\0\"M�|\0\�f>\�\�\�,{\n����\�~���\�g\�}u�J��h\0�0�:\0V�E\�n�\�9��V;�\�2�\0�|Y\�b\0\����õ�oA���\0�Rˉ\��H1�&ƘW�\��\�G��rN���\��Y��SJ�\�\�\�%�c����s;3O�[\��lZPu����Dt6\0�\�/�(�yu�֛2s�������\�B��\�6�Բ\��m?r[Q�83�&\"W;\�\��\���n�\��1\0�x��\�ʛ\�SJ�����v\0�<�&\"7x	ɴ͗��ܮo1��\�0\�\�Y���\�=Џ���(~YD\�b\�\�\�Q��Pk�?\���?�<�\�Y��Rˊȃ\06���JDS�sod\�]JD\�G⨐\�\�|��\�Ȝ�\�zgf>�~Eo�ȅ\�|�s\�?��oAm��Ǜф�53�%�3�=⻇�\�\08\�>0�\�m�e\�\�D\�ik\�J�ej�\�sg�yS\0H�W!���Hw\�j�7�\�}j�^L����Yu�R��\�\�\�13Ou\�}���J�\r�L��\�\�D�{�k�=^)�Zߗ�`�y*�\�0�\"r\Z�\0X�\��T\�\�k�\�\����.]p\�\�\���A|>��\��f��?���u6#���hW\0\�Xa\0\�/\"\�E\�lc\�˵^��Z\�/���z\�w��Ќ\�U�A��6���\�ALȩ�[\0\�\0���\ZE\��\��N=\��|\�\Zf>\��X�+�F2�7��\�K\�O�ș\�|�@\�)zt��Z\n�h�V��KZ\�\�\�l�����\0�p3?\Z\��ߵ֙?�<�s��(����d\�=܎\�\0\�\�E\"\�m���R*o��\�����4�R�ܗ\�\��\"�n�\�\�c/f�=�\�9Z\����_8\�`��5�ݘ�\�\0�B��\0k\�i\"27�\�iZ\�ub�f\���\�TP�~z唻a�w�B)�,��kG?ٚ���笵G+���\�bc\�\�A\�\�cE\�7H֘�\�s���_�\�Kk]\�S�C�Z���7ȫ�\�s\�^/�Q+��\r�\�\\)YkO\Z�ȹE\��h=9@:_�4�\�\��X\�3�\�Q\�-b\�K�O��c�Z�@꛷[\���\0|R\';je\r\"����\�8>\�G\��\�\�\�Q���\��#\0<\�\0�0�\�8��\����\�w=��˗\"\"���K\�NYu�s�\0\\\�\�\�Z\�\�\�/�|=\�+\08����\��J����\\\�[E\�t\"\Z\'\"�\0\�SV�\r]-\"\�Zk�Wk�?ԩ�\0oK_Q\�\�\��y\Z�O�\�#ˊ��u`$��\�\�\�q|�\�z7�T�/v\�\�Q\��`Gf\���\�`#\"�]\�\�k�Wo��G���\0��&+�V̪g�y\�?\0���޸\��vc3\�����ߨe\�\0Ƙ{� �\�\�\�\0\\`�/Z��~�\�i�\�\��N��/5�R�\"Z1\�	\0�	\��������\�T\0#�\�sƘ�\�0\\����-\r`�0�2eʷ�\�\�\�\�\�\�K�R\�b%ιyƘ�\0.�0\�\�\0,�d��-\�\�_�\�`�:���ci�\�`\�H\�P\�\�Fy�uq߉��]E\�\rfn�n�/\���E\�\\c\�\�^��Z���z\�İ�x63�!\"�\'ٺ�\�\�q|��\0@D��\�ʬz\�ډ>j\0^���\��z\�\�\0����c���b�\�R\��5�\�W9�����\�\�N�u�\�z,3?��k���\��%\�q�$�q��C�\�\�4��N����B\�7��&\�\����E\�l\�$�~ݬm#\�:7U1\���6\�DD��v��\0\�@f�/�㻬��R��a���;� ؋��p9G\n\0X��\��f�\�ZW\�\�\�x\Z��O�\0�A�{V=�\�(\��v�mh\�-��^��\�p�^\�\\\0\�\n\�\�?�}ugѐ\�q;\0;��y+c\�#Y���?%�\�aC�����?��rJ����\�X�C��_}��\�\0\�)4D�Z\�������\� ͪ��ZYD^�9o8�x�tf>g�N����P?`ٴ��?`��s��7R[Ґ�I����\�i�\�d\��\�\ZaC���c���8�/\�ZoQ\�\�ιEQ]BD�1�~\0\�#w �\"�v�RjT]-o0u���\�OL/\�p$\�Kcnɩ��o�-m\�RHgG1�x\0�9\���z�T*�9��1\�R\07\�*\0>��!Y=ÉS�L9���\�\�\�~�T*-���m@\�ҳ)�����u�\�\n�qν�U7�\�\�\0�\�F\�\�\�<\�\�k�oeMh�7b\���d�%eP\�~�hX�S*�>%��\�0\�\r��0\�\�\�\�+���Dt�g\����R\�d�\��D�K}oc��\��\��Lk-\�+~�oc\0\�;\�j^�i4\r��+�F�A\�J\0�\�[�\�i�8�o�g#\�\�\������Է3\�C`7,+�\�\�\�l�y \��\�\�\�R����V\r\�p{\0+�a�JWWWޒ۫D��F\�\�!,���-׺\0�u\�U�\�E�TZ\�\�\�5GD~\�\�\��8m�\�1(@C=��ǉ\���R\�\�F}��\�p/];�1\0��gԛ\r�ݲZ\�r\0���\�i�+s\�T\�9��1\�\� �a\��\�}Q\0\�\�\"���z]+My\�\��R\0\�\0f��\�m��]\��:����\�́\��i�wd\�ߠ��\�\�\���ʩ\��tlO��\���Y�|B�\�P%��\0@�\�7����u�\�{\�@D\'�\'T�\Z\"�z+&��6\�\�x&�}\0��w4\�ܓU\�Z{��Yvu8��d\��u�\�Z\�\r�IDdZE?i��UhZ���I_\�~Pf�\�F6}�6�^_�\�&�(�,3\�\�\0 �㬵5\�\��:\�\��$YQcf�\�\�a�=��Nh�mC���\�@5\��x.�\�\�FD��\�<\"�b3�\"65VUD\��/�j��9��2R�Ƨ�pv\�\�(�n�_�\�\�D\�W�5�7M 3_\�E�M�\�g\�3Ƽ\�\�f\�5	�\�ù#�c\�+U3�\�`r3�r6\��T*\�D�8\�}\0�\�𓮮�\�s�?CDGcx.\�Փ��\'��\�\�\�\�ܚ�T*}BDo�a8	��\�H��\�p��\��\�9\��:���h���\�q_\�M5p#\"GQtmV�\�d�I\Z��D��s�\�AMw�*�J��h�0	�ra\�\�\�\�/���!.�a\�\�Z�&��wZ9C`\�\�\�\���s\�6ڦ�$\���\�D��T\�\�\0\0c\��\�\�|Y08�g\�3�\nE$�b3�9��-�1\�M�\��\�dC\�LD\�\�&�5\\\�Wk���y~^��\�0�e)\�D\���lD���$@\�|���h\�Pgr\�\��zp\ZJє�p\�h�y�u�p��b\�\\\\6XP��ZLJ\�==Zk]\�\�+��IkX���kM1jx�f���\�^7<a@Kh��@�\�.Z\��ɪ\�[\�\��P\�\�<��ߡ�\�ic�9]\n8٠0�ޅ\��\�, ~�/�U�\�O�1\r\�G\�r�]2�\�\�K\�蜛/\"6Ͱ!��d�\�y�\��v7��\�\�9��\��\�����\�\��\�\�\\�\�Z���@��\�<�\\�\0�\�W�g���J�U�\��\���A \"gT�?�\��gE�)2\�\"��!�\�\�\0�\�G���i\�\�S�L9�T*e�ދ��\�=s饗�(o+\�z\�6�&J��|�h\0�\��y�\�q�\r�\�M5��y���w\�eNgi�\�g\�\��>A\��\r�-�`\0pν�$�\0\�d\�\�\���Â~��<�\033�AD��0�mZ@\0PJ�\�Fx����.\��h\�s�\�sD4�9��Fk=��\�A\� U\�}\�M۴�\0\�)H7�ޘ�\'\�\����ز^<GDQ5��T]�Z�7K|@���\0��\�\��Bb\�Adf��ϡw�����\�\�\�{D)��t��� 8�9\�%�U\0Ƙ�\0\��\�j������p\�\�婾\�\0\�|\Zz\�W\"�\�\ZoZo\�N��g���R\�\0o6ŨΡ_\�֞ND?�\�\��y�I[\n\�s\'�4�\�D����zι�D\��\�Y\��\��\�\Z\�k�=��\�u��\"rPE-٩�-�\�G��V�\\�\�C<�Y \"T�R\n\�\�i>\�yz\�\�(�nm����\�!)~����\01sh�\�\�V\�8��\�:rN�\�\�~�q��S�\��QݖwM3h\�\�2\���\�-�0�Yhݮ\�\��b?�\�ċ\�\\�߾�\�\�- \0(���1\�k �U\�WL>C\��\Z\�>\� 2�ؼ�\�{�Ed�(��i\�U�m[@\0p\�-�\\\0X��s3zV7\�T�\\a\��G|����6 \00��\0>\0\0\"��Rj\�zƘ�ǽX!\"�\�+#�c�\�Dd�v\�t\�\��?�\�u�\�\�V�Z�\�t��K[\��>C\\�\�\�\�\�\�?�\�\�2\�Is��\'\"��j�\�I;B�Ƙ�\0\\\�7\�Zg�V���9\�+\�O8�i^Dl;��#􊞃ߚ*�^�{�paϼM\n�s\�\�\�hSv�\0�1�\�w\�Zg�\�s�\�\�ͳ�-\�̹�ι�rD��#����<`%Z뽙9M��� 2$\��ÅyD��s.wD쿗Y\0\��S��`\�z��i�%��4��W�֙��T��V���R\��-\�ƾ%\�wv�z\�Q�t�edς�A�鉡\�\"re\'����`\0PJ���\0�\�Cfc�\�\�W$�\�4\�ɲ\r����\�[�W!�;~�ǎ��cbBG��\0\��[\\椰|�a?1\��\�ڀI\�7���RM\rq\�X�\�`e\0ox\'��\�\0\�\�Tۇ�%\�Mg�\��LD\�{1\�z\�q- ��z\���̹\�\�0^��D䚼�s �%LWL\�6\��� �dyn!�,�+�2?K�{?\0\�\�\�	�\�~t��\�uy\��\�i\"\�X\Zc^p�?\�̹��0�\�e����\�X\"\�@\���!\�~�\�;�%LE�9/\�\�X�}8)\�\0�?\�\0�s\�0��>�\���\���m�;rRN\�7�\0̬|����G\�\0��W\�ΟHD�l��m�\�Dt@����R���d[\�\�~`Rww��n�ރ�>�_\n\�\r\0\�ֻ�\�(:�����\�\�KDf(��ͫ�\��#\"�+�֭�1/@c\�\�\��\�\�4�^�{?3�Q>h!�ox�\�ƶ{�ȍJ�\�m2D8FDnVJ-�w\�@\��.\0��Q�\�\�%A|;��RjU?���L��\�ee\�\��\0\�i�\�\�\�mD4�Z2\"��\�\���\�EA\�\�\�\�JǷ�\0�\�3\0�\��\�\�\�{�%\0@Dg(�V/+{��\'\0x�\�����\�\�>�㷘y?\0\��SS�\�;\�ˀ!\����\"�\0D\�\�Q�,��\�:d\�瑤\'��\�\�J�ME\�o\0\�:�x��\�.\"�\0,�\Z3����\�H\���h_\�\\n�	k\�7�\�r�}ٹ���2�1\�\�H\�#\��\�s\�fՍ\��\�\0�\0̼�1�|�\ZJ�\�E\�r\�\�V�\\\�̿4\�t\�ؽ*3�����\� \�7�\�Y�>�\�\�\0�y\�zlj=d\0\�\�\�\�\0�\�(\�Lߦ�ފ���A0>����0\"b\0c*�\0����\�Mf�\��u\���FQ��l�J��D\�&\0����\�l\"\�+o�Fk��Ϥ\n\0�A�\�`o8���Z\�{B��d\�*\�[��\��v\0\0@D�E\�\�s\�s\�\�+H�ʗD\�\��$@q�\n\�\�e���h�Z��c�L�V��\�EQ\�2\�8�\��\�b\"Z+k�\�Zh�m\Z\�E�TZ@Dk�a8�Ja>\�\�Օ�v\�?~�an/\"\�K�\�gF��R)vΕ�sw��GK�\�\�u��\0�w��\�ͽ{\0�/�k�L��=\��\�/\�0\�\n�}ι�ʉh�0�\00�����ι\'�\���!1\n.\�;\Z,�/\�cn��sUf>y ��֞�d� \�\�$\Z�S�s\�\"\�-\���\�:�LDf�\�\�a��\Zr4Ɣ\0\\\�7ˋ!z�z\������>J�e\�8���N�R�\��\�e8\�>l��ϋ��Ǒ<�f��ѐ �\�\�\�\"r5zv]n�\�s��\"2�\�9�\�+y\�(�FXku\��\�8^\��t�Ԋy���FO(j����z\�ر\�`o2$h�y@�!_��\�:��sn13\r ݋d\"��Z{T��Rj-k\�y~������\�\�!�؏�G#\�f��ܦ�Z)\�:\�\�G�%\�\�\\��Q� �tÛU{�!5\n.Gk�3\��\�A�۽ZkND�V�.���\�d\�u�dj\�@y�\�\�~�\�WB��(��^�d\�\�5��?�h����@���w)\�=�N�]Gg\�q|�\0|A�{W�- \0�\�m\0�j��ȫE\�i\"r\"zZB\0X�\�~�#\0\�\�\�ED_\�c� �\�?��o��L��\�ӊ��Y�h	\'��W�ވH�%\��\�\�*u�Ő�s.��\�R\�@E��\�^\�;�\�\�\"r$\�휛�WI)0�\0\�9�4!�-Q=\�\� \��#^�MI(.\"OT)N\�\���\�\�S\�8�\r?M\"\"�EQti_\�h����ys$K{�D\�Y�-\"�V\�o���\08\�f&WJm\"\"w �q���h�>�\�eD\�\0�^��\�b\"Z-k)\�\�e��dR�\�A\�3�\ryj�7g\�9H���̼�1fN#\�i�=���\�?���(\�\�*�Ɗ�\0H�\�p�a:b@n\�9\0.\r� 3Ұ|9NDN��\�\��\�h\�v�)Ƙ\�E$]&[��oVJ5l�\�Z{n��>�$}\�T�s\�y\"R\0\�\rǋȭ}tǋ�hz�4{QD&#\�M~�\�e\�Q���hI�u���@�- �d\Z\�\0��S�f潌1�U��\�{��\�\0&�S\�{��\�gɷ�w�\��?\��\�\"r��\0<ID�\0x��v#���hK$\�\r�N\�&\"�FQte\��F��(c\0�IDkWK�\���\0�%�@�̲@D���\����\�zkf��\��\�;�\�\�\'L���Ve}\�\"\�\�9�~�kF�	����\�\�\�{�¾�B\"ı�RKbh��0�ȩQ_\�s\�\�i�\�� 8��ϗŰ �\�u	zv��G��Ƙ���\�\�\�O�\�(�LѼ\�E3�Ez�\�\"b\�#\�{���\�^�D�\�ȑQ]\�\�}F�\�\�\0�\099������0�<3ob�t�ܰ`����Dt&z{\"\��E\�zc\�\�y\�*��\'����%\�{np&M���Rj}/\�t=�\�ח��\�\�\�\�\'\Zc����\��\�.�-\0�ȉQ�R\�&k\�O�(\r�2�Ck�\\YKK6\�>=υ\�\�\0�0#\�\�`$-@e��׽\�\�J�1^�i�����#���\rk��}��H�W��5}\��N\�3_��vG\"��\�s�MD_p\�\�%vf\�\n0Ek=\�\�&t �Z������Z<\�@QJ�\�	\�-}����\�t2�\�m���\�\�@P͆\�G�	\0\"2)���}�|��\0S�R�\�W��[\"��X��\�\'H�\�?%\"w�\�Mպ\�:ڵ�o	S�\��h�\�0���@Dk0�\\\0����6�)��?2\0\"rfE�\�E�`�R#�h\r\0�Dd~V@\Zd\�\�7���\�\�z��\�->h��\�A!�A)��a\Z ~�_�Ό�Z\�M�y6z\�-\�ӈǌB����g�B�{�s\�\�*�Մ�v;\"�	=\�b��h�j\�Ð_�J8\�^%\"B��\�V\"��0�Ԡ\�[)����T\"�=⻱�\���`�\�E�3z\\�G\�\�\"2�<\�WQJ�\�ZSD\'��\�\�k�\�o�\�@\�\�\�:���.�C�s~���G\�\��\'Ed��ܒ7J�����h\"}=�\00߯�\\�um�)\�\�h��\�7�\�>��]\0\� IE��U�8�\�g�\�|\n\�*\":\�9�\Z�D!�!�_^�.�X�Zr̼\�Jf>\���\�H\n1�R+Ѯ̼+�\r��|+\"YZ|Iz�GD\�f��U�@!��S���,h)�\0ZJ!���R���,h)�\0ZJ!���R���,h)�\0ZJ!���R���,h)�\0ZJ!������\\a\\*Q�\0\0\0\0IEND�B`�','Cursor que hace click automaticamente.',1),(2,'Abuela',5,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\�T\0\0\0	pHYs\0\0\�\0\0\��+\0\0\03tEXtComment\0xr:d:DAFkYeWKoDI:7,j:48205749140,t:230530098#c\0\0iTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>producers - producersAbuela</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-05-30</Attrib:Created>\n        <Attrib:ExtId>2ce55a34-0b7e-4fa2-b36b-cf277bd91518</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>��\'\0\0(pIDATx�\�y�\�u��so/o�\r3�3 @l$R�H��HLlZ�T�#�Ǳc\'�+�˖JK*v*�\�L٩\�J\"��\�\�Ēm*f\�J$9Sd���$�f_\�\�˽���\��M\�@HOիy��\���\�=�9=\�[tC���7�-��\0��\�-@n0z��\�\���\0��\�-@n0z��\�\���\0��\�-@n0z��\�\��\Z�\�\�Qn�\���\�ڵ�\�~��?\�-�;9?\�\r\\��\�\�\�{\��<(\�Z\��~\�h48}�4\��\�7\�\�[7��$dtt��}\�c|���S�N�333;]\����v��<V�V�;u\�ԅJ�Һ��\�y\�G\�\�\���ۿ�\�z�bǎt:~\�w~�G}T5\Z\r{\�\�)��\�/�\�C]\�_��\�ȡC�aǎ\�{\�jzz�\\(n����GDdTD�\�F\�\�\"r\�Z�Mk\�7�\�\��={�4�\�f�\�OأG�p\�\�<ϓ��\�\�\�u�\�.Zk��w�H�P(|kqq�r�^��z\�)�\�o��^z\�ˈ�~��>|���\�f��\�233ӧ��Q\�\'��)��5J)1\�\0Xk��\�X��\0\�{��Yk3\�<\�n�\n�\"\�h�w\0�w[k\�\����>k�����ש������\���\0�?�8<��u\�C��; ���|�\�\�[o�ӧO{J�[\�\��E\�\�\"�C)U\�Z��c\��\�\"\�ݪ�����K��@�[D�[k{D�(\"(�$%�16�cc���\r�\�B������z�ĉ�\�lr��i{\�\�͞\�ȑ#G8r\�7nTccc}�\�ޭ������֢�k-qc�\�$�Teu�*���pR)ʀ\�7�E)e�ֈ�5\�H\�\�\�^��\�j��� 8\�\�t\�\�=��y\�gx\�8{�\�u\�\�u\�K_��8��Y)�\��_\�ʫ�8��@,۠\�	π`9��d3\�Rp\�ZK��~���\�86U�&�>0�/\�8���\�\�\�\�ŋ\��Re\�ȑ#G��\�[{8�i\�o\0��Rnz�%/\r�W2%\0\��9	Y�q5�\�Eq��\�qD\�\�ql\�8�\�\�&p�\�8��\�c\�\�x\���/�F���\�߿�\�|\�3����Ƙ/:�Sˌtf`I%9��\�\Z)�H�	H�j����I\�\�(C\�8�Fkm��Suf�/x����6�o\�~�ly]\�\���?�a\����355����\\\�UqK\�)u�\0V#;��\�v\�3\�tOw\�\�IF^�VJ�ֺ�fމ\�ZK��c�FQt\�\�ɓ\�V�U����`Wu[سg��<y�f\���\�\n��?�QuWJB@\�hw��Wsy �LϿ��nFv�(��\�K�\��\�q���8��a�\\~t\�Ν��zz\�Aj�޿?�7o\�q\�SJ\�L*�S��\�up]\���(\"\�0��������ZU�e f6\��\�\Z\��q]�N�f�\�ZDd�1\�\�|�͵\���\�Ŷ�SY��ԧؾ}��(�~]D69�#�\�p�(��\�vp�+1\�{������Q�]\�2`��\�*�F\�Fg�\��\�8\"\"Ƙ\�Z\�\�n�\�\�%�_7	)�\�h4\�c�=����W����\�vO6@]f�d�J���\�Jp�\�y\�f\�2UCݵRw\�u�{ʾ�a�h�]\�S�N��\�ȑ#\�·u���\�\�\�\�t�Ƙ\�wGH]\�\�u��\Z�lK���ֺk��\�2]��K�\�\��~\��\�\�\�b�L�\��\�\�\'\�ڹ@T\�Ƙ>\�qT�V��-[��\'�|rMy�怌���a\�\n�\�m\"�i�T\�q�\�\�\�^ͽ\�ہ�#�N2F��˲��X,\�8�V\�\n0����۵+��\0]�\�(���+;<*1��\�0|�\�h��t\����kƿ5WY{�\�%�\"��b�ݤ�\�1�`N_gL\�N�\��x�\���\�\�0�\�\�,3�+][\��)�\�\04�\�\��J\��\��e�fF^:3����sHR/h�{���ٽ{w\�\'?�\�5�\�\�\\By\�:�΀��\�\�U\�余,�\�\�\��<\�\�\�\�~��O�P�u]\�0�\�ju�_�<�l\�LE��H$�P(\�c�\�\�ϫ�l/�\�Z�V\�r�\��\�\�\�n\�*��q\�\�\�(O=��T�\�v\�=���\'1cBf��Y罰\�K\'7� \�~�\\(�o\�*�\"\�Z\�\ZKR�!\�b�F�\��~\��f\�_F��˞GQ�\�y����1?^�T~oϞ=�k\�\�5d߾}\0�\�ڢR�k\��#\��A_F�\�\�ېL�\�qL�\�\�J\�\�5�*�mߊ\�8`a�Z�\�y4; �\�2\�j��\0DQ�̠\��ֺ{�TrDD\�#\"5��k,�) >� \'N�\�k�}o�ZV��\�\�+�y@�Z� X�j�\�:l\�\�cۆ�D\r�H��[�9yi�~�\�jQ((�JA@�\�Y\�\�\���\��^�;z\�\�\�j\�\�\�k\�\�5�!G�axxXi�8\�8�d�\�|/3��ۙ�\�\�r���(}5c~%.[7�k�&{j˂���\�\"�\�]Օ9��\�8β�2��;���\�U�\��˷\�r˅3gάI\�dͼ�#G���l\�KQ�\��wU3�2�\�j��\�\�Z-� Xf{`y�\�:\�yۮ��i\�0\�4@\�6�\Z�l`����\�\�l�\�4\Z\r\0\�\�2�\�_a\�V�����\\�T�>\�\�Ç\�4\��&*\�~\�\������@*g��̳S�yIav?c�\�j�\�wDp�\�s]�*e6��Qp=��#yʃ��V\�\�\\��a�\�$H\�`�\�\�q�nN�\�\�t%(�\�\�\�۬tm\�Z��w�w\�{\��ލcC�������pV&\�V2*;y���\�l��Gk|ץ\�{�}��\�S�\\|\�\�\���\Z��2F��\���J�È�f���E��\�ڈ\�y\n I\�\\�\�688H�T��m5Z@\�\�\�8}�4\�\�\�c�:\�\�jyWXkM�\��ъ]�6Q)�]G+�H\�Ű\�1ȃ���ũU��\��^6��2>;ǉ�cch�\�DQ�̵ί�w*\�߸�\�lv��ZiM\0QJẮ.�Զ\���gp\0n\�0�Po\���\�bbC�:AQ�\�\�I^IQ\�j��=I�9Gk$�6f)���\�}�x�\�\�\�K�R�ne�\�*���li6�<�\�\���%Z@صk\�ϟ�X.��@�U\�\�ُ\�ە8�q�f\�@�20&�gx\�\�\�8{�gϞgbr�F�I�\�!�b~�ӿ̭���VJ0=;\�?�̯PH\�B_#۷2�m{w\�bx\� �\�b�ʾ\�W.�\�h���\�+%=\r$%\�\��\�\�`\��\�_\\���gϞettT|\�\�T*\�Y�0\�)��~\0`c_/[��@�\�\�[O|��~\�\�h�\�\�z�\�\�\�qi�2�SS\rn\�m�\�ʻ\�y7\�^QF�\�2v\�2�S�9w�NR)�(�K\\�\�7��\�3�lݼ�b�\���\�֪\�6\Z��dnyV����1\�\Zc:J�?|\�\�\��\\3/\�,0ܻw/Z\�yk휈l\\�~&\�.t4\0Gk6�c�efn�\�g\��\��}\��!\\����(q=?}�\�N�\��\�\��,a\�n��u�ڤN�0;\�w��,�o\�Ɏ\�ۺ\���đ��\�h%\�\0�Wsj̷\�����c\r��5�C\��j�\�\�X�A��=\�1����1&qk��*�� ��X\��\�n��VCcIt��\�GXk�X{\�s���R.\�.�1\�<�\Z\��}�߃5�NΛ�\��\0ld��w yP2@��\�Ν[�w\�\0ٱc�\�\�﯋Ȕ]\�QP�}�m\�N���\�\�*�E\�P\�G)�\�{\�ݎ\�(�s)�,���\�\��f���4\r�����\�.��<�ݻn��\�90\�\�h\�\�\��n\�F!\� d\�:t%^\0_)��C��=t\�\�5�q\�T\�׿�u~\�~*x\�\�α\�E(\0Z)vo\�BA+\�0�`��\�:�\�\�lbE�\�\�O\�j6)U\�,.\�/\���\�.�Ҋj���P,ٷo\�\�I\�ӧO199���\�z�\�\�X��=��b�@�R!�B\�\�\�y\�}	\�M��\����J��\�\�[x�\�\�\�<-\'��\�G�ջw5\r�f�<��\�u\�]�\�ŕI��\�1\�S��0G��e��\�cs�\�+\�Q�\�r\�\�)&\��� �x\�;\�\��Su|/\�W\��F�T��\�\�={\�\��\ZC����%61���8Z3=3\�\�w\�\�s/\���en!��l�<Ug\�\�.�\�����\�w]�n\��\�/�\��޷�g�\�\�\�O��84\�@O�\�\�e���LR�\�233\�NMM\�\\#�iŰ\�l��\��<�\"\�0�==Mc|�\�\�,�R�b�\�\�\���_\�?=�_y�\�y\�y\��\��x�;\�M�ga{� �G�\�\�o?\�\��ON�ap�?�iΟ?�\�hJ\��<�\��cå\�)�\�\�\�mw�X�bL�f�2�\�&\�~ϻ��\'?\�\�\�yO=���\�\��G�\�\�j��\�R+����KiOOFA\�\��,p$1\�[K��[*���z��\���_~�\\HE,6\Z�\\�\�\�M̟>I\�\��t���\�����J�\�B��+0~i��\�*e�3\'#\�\�Az�7\�	\"\��\0/=ʅ�\�\�\�{��� &N~J�⫯�䷟d\�o\�\�9�\��We�R�m;\��.��4g!�����8x\�(���}�iywc�\�\��)m܄v\Zi\�+��\�\�M\0?+�]+�) ?�?a�;v9�\�ip��&6�\�V�\�\�;[M.?�]Z��XT0\�\�\�\�\�\�|�\��[o�\�j\�\�ٵ٧쿛jɥ�Vd�h\rӨs��m��e�\�\�\�2\�2\�\�˖M��y\�6\�F�m��\�\�\�\�\�Ŏ\�h-\�\��8@st�\'_cxh�\��hz��\�d`\�~\�b�ӗ\'�s1HVB��\����q�Ph;v\�=�5\�\�~\�\��\�G?:\����1�X���(b�\��l�53�vLb\r��<�\Z\�\Z�\0��\"	B,�\�Pξ\� ���q\�\�\�$n�P�*Q!�ؽc\�x\�O�\�\"��`�&\�K\�	c��8ܶ�LМ��d���Xl��\�g=\06!�3Z\�o�\���sk\nH�\\&�\�p\��=3|\�qh�\�\�\�C1��^��y\�  *}��\���0qL\Zv��,83a\��Ю����\�<^�����\�\�w��\�i\�V�.d\�\�{�4{\�U�\"x\�*a}�\�t��6O\�G \�\�b�?ܶm\�姟~�ƊC\0^|�E\�\�\�\�\"��Ǳ��5a\�\n�\�\���}}�\�b�!\�t�\�\�\��\�Ci�v\�b�PDi�� 4&��e\�s�E\�b�k�P�G�T��2~��XB{� ���x�\�a��\"r.���\�\�\�X�~\�5\�̙3\�\�͙M�6}UD^X\�C%\�|��v=j#;�5�\��[�2���\��kb\Z�/ќ�L\�n_���\�ծ\�U�\�FFѮ\�|�I�+R�\�\�W\�\�\�^��\����\r\�\�^\����\r\�q����mq{i}��\�Y6o�44��\�)$��`a\�^\�!���Mp\�f<���e�PL�\�V�ֺ������e\�u\�kXkS\�n��[*\��\�\�2CX�xu��[�l	}�\�k\�Y�ּs1Ə\��\��\�i�\"\�\\��\�K\�\�\'-��~�\�t\�\�[�\�-\\q�W&um��XB�n�\nK ���:\�\���\�(\���4\�\��:\������\�8�_Y\��K��G>�zzz.�\�[H\�Ù�\�L\�\�c㘰\�\�\'Z3S\�\�\'��e��<\�\�6�[-L$\�\�ZL��\�{W��l\�W�\�i�iLN`\�\��yN_\ZOl\�R\�̦���\�\�\�P\��@\0<�\��a\�tf\�E?{�c\'O�\��$�U\�C՚�HOj\�c]��\�\�N�ٓ�2\�$�\�)\�\�S̟9\�\�\�ĝ�\�\��\�ᕝ�\'/O�\�\�\�;y�\�g\���\�eM�w�֏8p`\�\'�\�m`G)ž}��A�\�V\�\���,t:�\����ذCy\�0\�I2��״�]��\�n��[�Ҟ�\"l\�q+UDi\�N�B�\0*\�\�}5\�\�U;x\��\�Q\�B\')㮘��i�e\�Z��]�v�\�\�>\�Z�#�\�\�K/�\��\�\�G�Ǵ\�\�\�F8ɦ_�\rl[\�Z\r6\�r\�\�[��?+)\�Ɲ6��\�7\�&��q���R\�\�\�ML�ҙs�\�G(��\�@\�\�l\�\��\�\�\�ٿ:777��O|\�\�1\�uh]�pO�:\����B�Z\��+�CK\�㔑U���\r\"�7B�\�-O�N\�Ki�� J�r�oD:\0��=O;��Z1�`\��~�ĉ�+��+Qv�!Z7p����\���\��;#4Ex>�\�<Q�\r�~\'|������j\�2 _�Ļ�f\�u\Z�nE0�g�\��e\�u�<oݦp\�UB\�\�\�\�\�lܸq�������LJ�]��DE;M�j^�\\�� n�Xx\�儁��5�\���\�N\����Su�z��wr\��\�\�\�\��\�!�o\�0�\�g?�Y��SSyZW�\�\�?\�\�\�\��\"�մV�wQ�\�\�;�sT60t�m\�\�Ȳ>�,^0�ɯ?�³\�\��\�\��\�YlRٻ���I��z����������f�\��|m�6�\��\�\�w\�߿l���\�&!몲2:y�\�mJ)��\�=�!\�t}:s�DW�!\0���I���\�b��`j�`j���ꯞb�\�g��~\�ުd)arn��*]��\�oj;��<o\�\�\'�\\70\�:\0r��y\�\�Jx�1(Ϩy\�#�\"\�3�\�[X\�\��`\����	\�\�\�Js`Jk�\�%\�k�;ϳ��qlv�p�8\�\�\�L\�\\�%5yK\0���?��kc\���u䩧��\�(�7���\�	\"BS4�viN�_\�\�c�,;�U\n���V�\�[\�)��kU\�r�bon�\�\�\'\�LLa�\�JK��B�ٵ\"\�=���XI\�\�;\�\�r\�\�_���1�u�\�\�\�\�(���v\�ƍ��Ȧ�)`e\�Y\�H,�>��9L��N43RE���ޅ��{�{��\�>s!\�g�R�*Q�z\�\� \�˛_K�K\�\�];�\�\'���sF)e\�8\�\�x\�_�\�q\�h|m5ZW@\�\�j���\���R>�V���dA;�c\�.Pݺ�\�-I�G\�{;o[�$LuO�f��V#k�f����t٥ץK-o�<`\�\�\�\��\�Е�nn\����\�_�U1\�Ԁ\�8Ά�1`YWc�t=.|\�G\�h^��[,\"z�VE)�\�\\\�:I�\�qG#���\�h�h��3u\�g\'&Y��F�\�+_0\�(y\���\'\��n�}\rHn�s��\�5�\�ɚJȡC�ضm�NG�\�\�/�Vk���+\�\�\�2�\�;�h+yU6o�6\�\�\�\�̝9\�\�sT�l�<�	\������߫{\�\�Z\�N��\�\�\�	��Ҧmx#��\�	\�\�ql�\�e6$��l\\:}Oc�~E��\�\��\�|\��֚ݻwۻﾛ\�\�I֢.��q\�/�\�/��\� 7�\�M�\��3\�/i�u:\�)+��\\\�EY(��B�r�LϖA�R�\�W\�bcCk\�,f~�Bo/n���\�tY\0c	[-�\�)o\�\��\�\� $l\�\�\r\Z�:�\�:ͰC�ݢ\�n�1]\�\��IU\�c�(�ƘE\�\�-..��\�^�Xܥ��x���|0�a:���u�?*\"u]w��l\�\�\�0��^\�Ơ\�\�c�S�\�(�\�(�\�\�J�\Zig�Ǌ\�\�˴\�\�p\n�\�x��&�k�\�r+A��(�[�1aLO_/�Z�\r\�6�f�f\�\�\�\�E\��^Y֨�%�1�\ZE\�\�z{{\�\�Z��\�z��3SSS\��\�\��5\��\�����R�Ѩ�\�#y�1{�\�*��R\�R\�\��T�	q�=��\���Ԓ�z\�!n��b�R\n\�@\���`��\0�T@y.n�@ɂ?=G�T\�\�s\\��\�\�dF>m��\�\�i�yg��� �h�\\>��\��I]}͍��w\�i�\�\��J�Px�\�jmF%!i�\�W�\�B/Ş��lD9Q��v]D	ւvZ�u�ִ�\� \�$�\�<\0\�860�\�\0�\�Oi��WN\�\�\�9\�KF\�\0���\�]\�\�\�\�ġAĒx�\�\�J��h2�\�S�՞�\�?�c�\�/~qM��\�n\�\�?�q~\�\�~\�\�ܹ�h�\\�Y\�oYk�-�c�m+Q=e\��{\"҃�\"Jh\�/\�UJ `b�\�`m\��#B�o��n)�\r�\Zu�$\�y�\�<��(�\�BD��FFh\�!�7q��S\�\�\�9\�\� \�R\�1\�\�?\�o=n�u)Xk�ǱǱ�G?��O\�kyS\�uM.~\�s�\�;�	\�\�2333�\�e�Y|X�\�t~�\�&���\�塾�ffW�1S\'\��;D�8�,�\�yW�.y#�=\�|�j`�C\�\�!�)x̜�@e�\�7\�t4nɧ5��r�悹�/O5\��˳�\�ȑ#����V�9A\�}\�C��\�ٺ�\�\��:gΜ\�g�\�\�_\�\�zWz�\�T\�\�E\�־�\��}1qL\�	�+K�\�\�s�\�○��\0b\r�\�\�Y\r\��)5fZt\�-���S�ЮC{��[�QZu�|\��0�!h�Ю\�+׹׍\��\�u\��\�|�_�\�_d\�Ν\�\��\�\���\��uI�C�|\�o�=n\�{$��\�\�\�\�\�-6:DA@y�&ΊS�1A�t6!c\�t\�TJ������A3;!nގ[�Ѿ\�\�\�\�{*h/\�ڒx_QLsj\�*ϱ�\�a��K\����\�V\n\�\�\�躤\�o:\�;6�SB���\�z�$�2\�d��*7\��C����r���\�߱�0��\\1ʹ��ׂvD\�\n\��PB\�\n��:\'���$�\�\��\�Ei\�.bbE\�Τ��y\�\r\�u;�\�\�J���Ui�\�\nD#\�	���Q��5�8��8�p\��z�m&��s\�\�s�]�[Ȳԧhϡ\�SMR3qLFje���\�IBR���\"JD\�=��\�Qj-\�\�]?@F��o�YJ��}\���\0`���\�\�\�I�)6Iph\r&��\�S\�\�\� \�\�\�*W^\�KD�7�R쭤S��\�>GH�\�@�)z �D����\��\�\�\�E�_�\nV\0\�\Zl\�n\�i\0($�\�\Z�v��\�a���&\r\�\�s�%�\�{�SIc\��Kv\�D;z*(\'\�X�ND�\�\']�iR3BL��T\0kC�X�Ųv�({]�nRx��\�\�,\�s{ʃ�{*\�A�W)�:\�IIf\���XC��[Q;@;\�\�\��X�/G\0�!A \�\�\�#\�$y4�rҷ%J0Q��YR\'\�\�\�:ք�\���)-z֯��uu{�\�\�ϣ\�r�=�Ht�P���ô\�\�ܳ}�W�\�ڤ-=Kq���I.I�c,���O�ͰQL�i���8.q�&\0h.tp\n�\�V\�Ш\��-���V]Ueb���͂G6\�\�G�\�k�s\�\�]��Jd\�ͻws\���u\�ٚ\�\�\�\���wY-�Raө��~�5�#�}���\��O>*\�va���\�Ư�\��!��+\�Yl\��	ӕ\�`\�8)R\�䔇��\�WI\�:uD�\�h7\r�̓�VD��\�\��\r=x\�b��\0\�KN��\�qL\��%{�\�i�?����P\�~\�/������[\�\�\����e#�\�d�x\�hM%\�\�\�\�V�kR\�[,�+w\�-�\�(��\�\Z��`o\�R�\�H&��E9��}�ҩ\'L\�\�:)l�q}\�j�3�8^z\'�8\�\�\�{(�c\�h\�\�v�N\�R\�4�\�Қ�cc�_+\��V��Y\�\�\�M	D)�v�5\�:�ʟ\�\��3\�B�|PD>b\���ߤW`���]3?ֱ\�q\�s�=�f<\\@&\�@y\�Ӳo׶bi`\�n��\�چ�\��e6�Hv/#\�,4d\�\�E\���}{*\�N�Қ�\�\"lh\�Mt���cl�t\�%N\0�*\�2�\�h� q\�\�\��\�\�}���vA��R\�uw��1Q�S�0AD\�	\�\�\�y�\���[�K4\�&D\�ǅŶrϥ�ѱ\r\�y�\\\�7w�����&@\�\�\�\�m?6P,Ϳ;��O�8�\��-@IDT\�L���v�\n>ZkZ�u.=\�\��*��`\ra;D{n�G�N�H\�\�\�&q��\������=�V@\�	qK�n\�\'A�EPo\�}D+�\�`�\�$7ÉÈ\�\���\�a��\�X�4�vq~ze@!R�\�\n?\�\�\�\��\r\�s\�F\�o\�t0\�Z��^ ?60��︣8E�w�1�k\�H٧-�\�W*H�R\�/q|\�uPZќ�\�)xl{\�~D)�F�8��\��\\\�+�K\r\��4\�\�K@��\\{N2\r�t텋؜7e�eal\n�T�)x]W\Zk1QD\�	�X���G��쫴\�Q�C�T̼���@RH�)�z�2�K��6a\��\�ܛWa\�\�\�￹Ӳ�\�қnR�RR(��P)\�<�\�,���\�\�̝\'\��n߈[*`��\�Kӈ$����4|w�,O2�\�$$\"`�\� �R�\�Ҕ>И�%h���%\rZ�\�\�Z����\�/�\��\��*\0~�H�RNU\�Ҿ���d�\�\�=[\�\�G\���OL�i��i@�\�\�ϑ[n�\�\�\��&2��ߕb��[�%�2��o&\�J����d�\�)f\�\\b\�\��e���\�J�ziaM�2}\���\�:D�\��o�\�\�\n)\�N�y.j�F<���19K���\�\������\�[\"�{Ҫ�\�\�?\np�ܹ7\�\�k\nCו82\�t:(J\�ʪ��)_\�뾖�[,0z��~�\�~\��1QL���\�{\�/\�О��\��N��\�\��d�t�4\"Z#�Ci�Fkv�\�\�W�i,�k\r\"ɿ��\�r\�\�Ǹ�\�J�Jw�*\�\�j#q\�Gp�\���O���k�������\���s\�6q�_�\0q����M\'�\"������e\�rZ\��s\�/s\�/Q\�`����Iy7QU�hEXoa\�Ǵf�Ŗ<.cQ�\"c\Z�I�!i1[ci\�,�\�\��\��\�q^����W�q��1�\�:\��0L՞\�^�\�ʕ\�{j�񶝋_�\�7\�\�7\�#�\��\�2|\�\�/�M�$��B��Jo\�\Z�\��ݛ�]�n���\��\\�\��~�9\����,\\��odn�Н#Iʻ\�Ly��F��\\�8�{�\�|�B�\�uq�\�Bl�������y\�ߡ5��\�x�\�m�+\�Dɿ�XH�&�~�\���k:/?�0͛1\�o*Ra�=�\�ʫ�\�3\�ޛ\�����J\\S�\�\�о\��3ٌ_DhW\�i�(������X*�6/\�L!�44D���|�\�_K���&~�����K�\�\�Ҙ�\�o|�\�uo��]{���M�\�A��\�\�\'��A�\'k�h\���\�g/�3g\���y{\�*�o\���\0��\��d#��7oI\�\0\0\0\0IEND�B`�','Abuelas apasionadas de las croquetas caseras.',10),(3,'Suegra',25,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0d\0\0\0d\0\0\0p\�T\0\0\0	pHYs\0\0\�\0\0\��+\0\0\03tEXtComment\0xr:d:DAFkYeWKoDI:7,j:48205749140,t:230530098#c\0\0\riTXtXML:com.adobe.xmp\0\0\0\0\0http://ns.adobe.com/xap/1.0/\0<x:xmpmeta xmlns:x=\'adobe:ns:meta/\'>\n        <rdf:RDF xmlns:rdf=\'http://www.w3.org/1999/02/22-rdf-syntax-ns#\'>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:dc=\'http://purl.org/dc/elements/1.1/\'>\n        <dc:title>\n        <rdf:Alt>\n        <rdf:li xml:lang=\'x-default\'>producers - producerSuegra</rdf:li>\n        </rdf:Alt>\n        </dc:title>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:Attrib=\'http://ns.attribution.com/ads/1.0/\'>\n        <Attrib:Ads>\n        <rdf:Seq>\n        <rdf:li rdf:parseType=\'Resource\'>\n        <Attrib:Created>2023-05-30</Attrib:Created>\n        <Attrib:ExtId>06b1af53-edf9-47b6-b9da-5bb7fd8cf83d</Attrib:ExtId>\n        <Attrib:FbId>525265914179580</Attrib:FbId>\n        <Attrib:TouchType>2</Attrib:TouchType>\n        </rdf:li>\n        </rdf:Seq>\n        </Attrib:Ads>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:pdf=\'http://ns.adobe.com/pdf/1.3/\'>\n        <pdf:Author>Silvia Ruiz Carrasco</pdf:Author>\n        </rdf:Description>\n\n        <rdf:Description rdf:about=\'\'\n        xmlns:xmp=\'http://ns.adobe.com/xap/1.0/\'>\n        <xmp:CreatorTool>Canva</xmp:CreatorTool>\n        </rdf:Description>\n        </rdf:RDF>\n        </x:xmpmeta>8N��\0\0%�IDATx�\�y�e\�U���\�x�w^\�\�5uW\�=�cw\�\rf�\rv��l,E@J�D)A��2�YI$04�m�\�\�\�\�v���\��T���\�|�3\�?\�p\�}U\�U]�\�U�j�n�\���{\�\�{\�5�\�Z�	�\�\"�\��E�t�!7\�b\�MF�r�\�-�\�dt�!7\�b\�MF�r�\�-�\�dt�!7\�b\�MF\�F\��\�\�\�{&o�@\�2�7z\0\�Fy\�\�F��һ���j�\�\�v��0�NOL%65�]@o�H���?VY34�\��\�G>��\��􁾪z�׺�\�/-���u^��c�<97z\0���@W ^�~��\�a\�3�_��a��\�8�\�6�\�\"rw\�i��T�xe\r,|�8�-�ɕ\�Mːm۶\�\�ʊ\�\�Fs�\�͢i\'Nc%�꽷mvC���������DP\�q��&MSTü|o�\�~�\�\�\�Zm\��\�d\0[�q2�0�g:J7�\�z0|\�D�\�\��Z�Q��0\"[T��N��\�n��Z�\�\�\�\�SՏ�i�9MSDD\��q�=��$q�\�Zp\�:����\0\'�ot��_>z�\�M�\�n*���m3V��\�\Z?�V?a�\�\�8�W�dx^Uߖ�\�x��\"\"8�##\�S��$I���1\�u\�����\�ǂ�\�EGlv\�O7\rC��_\�m\�T�\"�\�u]1\�@e���i��K�q]W\�\�7w�T�8��\�b���}EP��V\�{ձ\�^~�\�\��i\�-lUݭ��=\�c���O\0I\�T�(2\�Z\�y��}\��%��\��<r�Du��\"R~n�EU%w��x��Qc737`\�\�MÐu$�H����I�\����1&[`7SS\�\���=��\�<\\\�\�8\�\�\�\r\0km��M���n�\��\�N\�\�t�2\0ͷqj-bL��Uf\�q\�`0\�TRj\n[�\��9�|����!���Q\�|�Y\�l\����v��Đ]�G\\�n�^i6�ҙ\�\\�jkm\�\�\�\�ZKŤI���&)Q1�I����H)Q\�D$W[�^s��-�\��=�\�s\�7\�(iu�/�2=~�٨9\�\�=�Z}\�5�t1]�Np�~\�u�\�\�YUQ\�l\�>\�1�\�gnբ��\�$H���\�Ԓ&)(��*�\�8�\��&�~\�\�J\�n�srrrR:�Ko�\�I\�/kz|o�^o\�j\�w�����E\�-`U�e��֦DQ�� J��i�\�83�)U���pi��\�׷0\�\�\�C���I�\�8.�\�\�\�R\���\���}�\�\��K˪0\r��_�8|]\�\�3$�\�`\�\�]�ֈ�!\�$F�1�ܥ\�ԇ\�\��\�8��\�:\�^i�\��\�G�#\nww�\�\�b.�1a\��{=���\��\�U�\�y\�\�㼢�/	򢊾������ۺk�g\����u[�\�Ɛ�\�$��̦�4��\�~hr.�*i�b�-\�\�B5)\nI��\�\�\����1!MI\�U��&�Z%�ܜ\�&�\�Сc\��>a�jY]]�ؐKI1\�HXUDԦVT���u\�~�\�铯�\�v�n�}\��\�gE��ި\�cH\�D��\�\"U6ra\'c�)\�}\�!�\"�(F�\�w��L�l���}�ɶ�:su�\�\�I>�#X�SPT3\�+C<ߣ\�\�\�\�~SH�\�8\Zn�ֈ�XU\�_:�\���f[��چ�ׅ!�p�\�\��\\\�\�=�Ca-4�\�/\r��6w?5�\�R\�W;��{��\�\�ifZ!��O\�wpC)\nV�/<}�\���\�X\�E\�$�{��O�a�Yk�\�U\��<\\\�\��<T��I\nhj\�\�Z�ӧ惕3g���L�.^V�Y�%���\"�Z�fr�T�$!�\�r\Zc�`\��A[�\�J�QU�$\���\����\���\�&��G\�:S��#}ߖ�f\�x�\�k���\�u�`Qmn{�)D��j�R\�:kS*��L\�$Z\\\�>1�Χ�v\�\���55��P�y\��<\��$��zD\"�\��\�\�5\\\�%I�ADE$9C��鱀�\�\�n�\��׿��\�:Y\�\�S<wl�\�NT��\�\�KH�1�k\�nyO��\�:RD��\�\�n���Oo\��mt\nW��\�^T?)\"�0H�Tֻ��d�k�k�\�p�I��YUZ5��vN�v17Q��\��\nۦ\Zܻ{�7ά�8W�y��\�{\�Q<\����Ɖ�#\"�\�BC\�=�\�*7�6�!\�\��9\n\��6-urA�\�\�.�~�\n�aϦ\�>˃{g�m�8f,����CG#���\�E�\�\�z.q4\�H�I�K\��ٕ�*���Y�\�\�$\�\�9�\�� �\�\�?���\�9_�8?�\�\r�\�)\�>��\�`�m\Z�\�;䪾\\\�+aF�έ8v�SB&U	))A��yXE��>�R�i\0Ƙ�/�^��U.\�\�iñ�\�ffe�\�\"\�7�(\�b1T�I�a���A^A�\��\�\�\�6�7ʌ\�\�+%\��R�\� y�`l��6˕@�cJ\�L�\�8\�]\�tH\�8F\�3\�_[���]��\�u\�V���uժ}*M5Ɣ�\�1j��)�\�i�m��\"��}�L���rǶ6���K�\�ZK�yL#�O�l�\�$�\���,�c?˻\0$q��Ykn��]�\�0\�\�\�2\��\�d\�8Nɐ8���6A\���Ӹ�\�\��(�>�=\�v<���Ш��\�<6\�s	Ð0q+(q1^\�u�V��>�\�vl\���#�>̋A��\'FJ`�0�\�\�6B�w\�6�E\�D\��\�;\�;n�\�b3eS[If�x��\�{yL\�\r����*�oq\�L¸}m��ޣ\�\�\��:0d�Vk��O��\�\����+�V�\�\�\\]m����u[q9�\n?��m\�}�\�f]a\�(&\�({EQ\\\�D֦\�@\��ۊ��������a\��%��Э}\��{%s拂��<1B\���\�k�Ά\�8�\'��ϵ��w\�f\�D\rlB�קߏ\�\�F��\�q\\�\�\�\"f�M\�p��`\�v8�aC\�0��\�n�}\��`uy�\�z\��K\�G� U�*�c�0\�\�\��\�\�\�\�Y\�Čսʐ��p<r5�\�\�Ň\�\��bg�\�s�;�\�˧�9q�\�R7\"I\�\��\"B\'�N&ɞ\�\r�\�Ǣ8�x\�\�!��n6O\�H�g\�a\�C�N\0\"�m�\�[)����\�q�0\�\��._y\�,\�gV�(�=\��1��5|/C�m�_!cr4�G�]�Z\��vz���\�;�\�_\�蹵��(I�$�w�\�\�E\�X�A8n1��\�\"�v�=c0�	�Sr�(�VI��.f\'�\�7N�\���_�8�\�#J,\�[b�sp[��o�ds����\���g\���k��\�/�\���\�\�Ҧ7Hh.;f\Zܷ{�ݳMϯa(\�\0%��\�\�\�X�Mm\����K\�్XF`C�Q&\�/<���(Ġ�\�*b��\n�e���\\ϯ��\�E\�\�9�m3M�*\�~p���\'^9\���\�ױ�ܷ{��wO2\�\n\�TR���O��\�\��Y\�w��{{65\�k�Բڋ$��F\0\\\�\�¶^���V��\\�\nV\�R�⑎}�rɸ�\��ł�k��c���\Zu\�%ɣe�*\�\�\�߾�\�sg��|��y��c�#\���@�X\��:�ȣ7�gS�\�˽��k\�0^�q��e�6\�T�tSſl\�YI^�\�64r��.�?y��C��+Ӧ\0I��\�C\�]U�=���J�\�1\�\�\�[�*`r�}x2�3E@�h\�\�7̵80\�B\�<��*㍌1\�/u\'˛0#�,\r\�Ɩ\�6\��+_�\�\�5��A�n? \"s���J�q�̀�!AP�\�1%3�U6�\�hn�\n/I\�펵�\�bD��\�\�ŕ}�#զ\�:�9���V�\�H��<���т�\�Q\�\�\��f����k\�z\�\�$!;gw� ?��06����뺸�[�\�D�\�\�\�\�\�&��ƙe\�\�\��\�iʎ�m��\���YL\�u|m�J-ڐR�@Ǭ$GW\�cDqm������\�\��=6O�17Ѥ]i��\��Civ��V`�!Xk]c\�Oϟ��\�}�N��\�+���ZB<ϓf{\�=��\���:�\�\�ˠ��H��\�7��L�\n+\���)\�=L\�}��{\��\�\��o[\��\�6\�\�{E\�YT\�z\����|\�,�g�\�o,��x��wO\�~\�\��\�ِ\'_=]ڇVͥ�g�/��\�>km\�\�#w����={�j���j	i7\�nj\�R\�4H��*%�\�\�8\ZF�\�Z4���oopp\�ǈ�\���t\�i�\�\'�.��\��/~��l\�9����il\�\��\�\�<x��\�l\�$\�q3\�­�њ\�\�l��3K̡R\�yo�M\�\�|\��O\��\'�/c� �{*#\�\�u]JuUԎE;� ��ə�\�\�\�ٳ\�\�SO=u\�Rr\�9u�\�\�\�D\rx?\���T\�\�*tm�Qfd�W\��\���\�A�N�1Fg��/���v�o݃�\�\�yw\���\��;�9s\�=�\�\�;�*b�d΀\��$h\�\�s�?�;q��\Z�\�\��xd�� x|��\�eܮ01V\�\�믟\�/�9Yڎ{s\'/t�e\�1�\�pИc�m\� =\�y\�j��Q��r��t��;n{\�ׁ����FE�$Ñ!PF��\��\�;3��ٞbf�m��\�\�r��}�,w\�u7�&Z8�H\�\�4\�Qg���A��q:\�4\�Y?z\ZG �\�z�kף61�qC\�g��M7ry\�י�5\�\�3�c\"��~�\'_?�1YF��|\�G�����\�yx��j3�%��\��?�{7�!3\�w\�\�b�\�v\r���ޕ��\�q\\B\���\�\�\�\'qL�$\�\n���\�\�\�t��\�ܞ; /rP+�N�{\�\�	h\�\�.tgy��X1NYlW�C\�H�Oik�\\��\�\��\�\�>I?N\�5���w�\�	e���<4�\�\�W���\�\�CG��hy\�\�\�\Z\�\�y�z\�/��#��;�w\�\�2��\��+}Ej\�R�\�$\"\�E]�ɫ?�\�\��d\�@V�k+��Dm���F����e\�\�\�:N?NGT��fQ�\�༫�|V�U��\�V�\��\��\\\�f�f�\�q�J�i\���J�V\�E��|`ΐ�n\�\�\�\�\�OS\�uAq�\�+\�\'�6\�8\�o�\�;,\�\�b�\'^:SڻἜB�-����	�\�\�l�\rD�s˦gM5	w�t\�YYYa\�\�R\�BޥT�pY\�y\�h�P\�����\�\�p\\����\�\�>o\�Q\�AwmX)m\�H`x9�\�E\��I�G/\�\�{�ݳ�%��������\�\�Y*�\�\����[�ֶl\�r�\�X҆$�ܺ\�\"2�뺥\r���F�aKZ\�\�:�\�r����\�-U友K~G�qLkj�\��fjcm\�F7�\�\�] 1%I�\�M\�q�Q\�u	��4\�E]�\�F\�\�Ƚ�)\� �N?�\�>|�\�1�\r`\��\�@�60bE����屋x\�q:���y�C��$\�%���֓�%\�w�0S)\�\0k-I<\0���O4\�]��U;�\�\�XH\�9�Ɋ�\��\�Z;R[��\�N��2\�\�\�\�I��~o\�[m\�3�<O\\\��U�Y�I\�tm���\�\��<����\����>�DI�[)z3J����ăjS\�~�$\�<�\�\�r��� �ծ��ռ\�{��ժz*\�u�j\��\�Rr��\rI�vE\�O\�\�\�q!�}t\��\�\�$���E~\Z�nX\�-\'\ZG1j\����|�D\n6!\�_ގ�j�	\\/����\�\r\�wVQU�Z�V��ڪ�\�w�\�_0\Z�\�������\�sUHmj5M��\�\�\�ϧ\�_UԾF]\�\�6U�TU)�\0E�4�U*�\�a�#B\�R��x��\�.=\'\��5[�&g\�,�gu!ÓZS��ku��\�oF\"\�\�x�|�C��)tDڭ�%��.p�y�\�*\"������������!AHͯ}DU�$IR&�\\\��%ՠ�x� \�n��ݕe\�+W�\�qh�O\�hO6Z(:��.���Z\�\�3\�d\�#DYEL\�i���\�ѥj\�\��Ҡ�A�g9K��\�⽦��G}T\�~c�M\�O\�t6?F�h���0�\�\�\"��t��[f\�&kEHꭉ�V���\�\�B\�\�r�\�g^R��p���~J�\�b��j~\�t�\� \�\�\�9��Ւ\�iW(s$y{��%<\�i��S�=\�[G��\Z\�ݵk6���[k�\�Q\�=�-����OQ�$\�c��j����kK4ZS�=\0\�y\�Āc�;,�\�a��\�p	C\��RDYD`fs��\���\�\�@\�\��\�o�?\�\��u\�$\�2 �\�\�\�u\�8.�\\V�\�%\�#y#\�u%�\�\�I�i\Z�%Fk����ZBv\�\�%��K�R5�5�\�I@ב0K��\nq��\�\��~y\ndqJ���ZM8\�Q޾\�\��}\Z\�2}��\"���\Z\�?s�\�j?O\�\nI��{)`prU��q\�X�f\�c�\�c�Q\��ճ\'�ԟ�@�\�Ҭ㔱�\�8e��}��\�\�i:\��1U�\�&\�\�s;_Z뮝x�\�z\����\�\�~\�Z��\�Z#\"\�h6�h�22\�\��:0o���pj5\�Ȳ\����oP���\�{XU\�\���\�\��M�Z\r?	j��w\���\\�e�\�19\\0�8��\�W��[�2qQ$\'�Jr�XJ\�uɋ\��\�\�	\�\�jiP�\�\��\\\�\�zX{b��r���\�U3d0d�\�\�)\"J\�\�$���,\�ޖ�ٔ$/�W�rґV�<P�\�Y�\���GPk\��\��\�ِ��u\�Z@?�㘼A3S���\��]u�c\�܅�p�(\�w��\Z��Ùd\�_�*mY��)O�(\"����t^\���q�1���\�-v_��\�K\�5�\�d\�m:\�\�~5I�I�H�\�l\�%��a��`V5�T�\�T\�\��6x\�\�&��\�8�\�N��@�\�yQ����@�u�9-w#��\�\�k�Η�c%�jkD�\�\�㯶\�	��ǈ)�H%S��_Zu>~j�\�*��\�U�/\�<�\�Zo�5y7pW��\�#�\�\��B�� �\�ań\�S�^/V�~2�\�([��\�<\�]\�B�{t�\�l��/�Z擏=\�\'�\�{6��*C���E_{aS\�;\�5Z\�4�?\��\�Ξ=�V��\�\�4�fv|\�Ç���*\��>q\\�wȌyն�)W��[\�*ϝ�9�\�eߴ\�\�\�\��\�u{UI\��o\�S��+�\�荬��Ĥ���#\�9�\�\"\�^%�9��\"���\�c�\�\\XZHVV\�Z\�\�5��P\�\�Z#\�|0�7PJu\0�\�b+(��4�C��\�r\�Vg���G\�\r*/\�\�\�B\rz]N�����\�\�Z1�\�\�\�{�ݺ�璤IY�X}f5�/n�G�Qj�_y��Y^^����k�\�\�n\�;<�>\�6j\�G#\�r\��\�&L�\0I\�\�\�\�\�r��Cĕ\�x\�\��Kk-����3_a\�\�I���$\�\�\�\�h+m\n\�R̹@�s\�\�\�ʖv�}c2�\�\�ExFO@X�g�\�d��\�S�uy&+�\\<s�W��2���j�`�� F\�wV9�ܓ�Y\�h�\�ԛ\�7{D�Lt\�5\���\�N%�&\�2�3\�\�\\]\�}\�\�\�6\�~d�M\� Fw�U\�\���lb��f��c�w\rY\�y��x�9\�gl|��\�\�q]��U��ˬ.̓&1a�ɦ\��iM\�\��\��Y\���zq�\�z)��=\�R�\\z[*\�\nk\�ӎ�\�\�߂���7^{Avm\�};0b�\�W�\�1\�!�I�y\�m]�6\"ԛ\r\\\�#�#\�%���Dwe�\�x�\�05��\�{��,�+�\"\�\\���p�\0^����}�Q�Q>{|p<\�s�$ٛ\�52�F�6\�v��.\�R\�\�Z���c)����\'\�e�zup\Z��\�«7X96K�����Z\�>\�\�s�0613�j��!\�T��\n))REgW�\�,\�p.\�:-��:)\":v��\�\�`�\�\0�\�\�:�����\r��z#&���f;����h\�\�2��\�ŭ+D013\�\��=,�:\�\���nֆ6\�hNL1�y☑\�S�\�\��h��\�9C\�.l`)%�z��\�(\�v)�(//�.�\��\�.,��B�F�|Sa�,̞A\�a*\�c�\�\�\Z%�\��\�|�\�\�\"q�P5\�M\�Wf�Dg)2��\�\�=\�r[^�%�\�\�$��\�i�	�}�\�8�\']t�\�Uش*C\n)�rɳ�U\�\\\�uX\����Y`\�k|�\�\�:�xn��\�\�Ki*%@9R�&i\�0\�\�	Ո`�3R�ٮ\�a\�C)�\�\��A�ĵ2�\�0cx��k��ӷ�l�\�\�\�_+(�\�ivCi.Є\���U:\�]/�`J\�f����Cɡ��Wi�Nv�\�>rRD�\�y�\�\�!͍z\��\�8VqfVQq^�ަ�e\�o\�\�)Nh#Z56\�:04^.B/\�	�1®w�x�a�\\���d�_\�\�=[\�_x�%��������\�\�6��L��7�\�=�\Z�Wd9�<ϒUĨ개�0�\� *\�b1��Lߡ�\�J���N �\�4�EI\�W^M\��>~CP�V�\�!\��Ez�h���<\��(p0\�5�t\�_�ߵ3�\�ψHL�ȤT���Ha4�\�5eY6#�L�Zkq\�);\�c��3A�L%4-|\�\�Ng&���L\�R%R1\�@R�M�O	ӷy��\�`�cj�P�\���z��$R\�\ri�[\�?9s�\��_\�\r<s�\�⹥^��7Q��3�0=\��;�3\�n�{F�Uc2c���\�\�ބ\�$4f��\��z�z\� �)d�P��{�`��ͪF|��$(�M�VIz�s/*i��(�&\�u\�1V����u*�0\���z\�ܢ~._\�t)\�гN\�zk\�\�\��\�8��R��A�_�dh\�c\�l\�0��ͦl~`�ߴ�d�Ѩ7\��\"c9d\�p�8\r\�\�����lj9�5K�������SRU_\�X��\�O�W���\�0��\�l=]�\�g^\0ӹ\�^\�o\���O\�\�Ok�\�\\�N=e\��\�.�\�\�}\Zd�\��y:=ͼv�\�_�ð\�\�\�!{�Wt\�\��g����:CY����@]��\�ƴ\�]\�-\�Ϲ���\�U��p��ݵv\�G\�N\'v�A��\�?o>(���Q�.�<K\�\�C=j�YI�\��4\�M@\�X���\rɀE\�c��\�\�ɥE.hY�\�?�k�y�*�\��AP\�Mi\�9����I\�TT)\�\�\�%�k\� |QS��́��¿n�7~G�O����\�`\��\�L\�\�\�\�8j\���7��A�I߭6�^�\�I�\�k)�*k��\�߯\�y>\�8y�;< �8\�Z\�\�\�i���	�1.[�\�n3^*�1\�\�\nG\�2�D�,\']65\�2T���\��\r\�.&:7j\� ��|�\�����]Ɲ�݄kg���/j�tľ=\�\�\�O�[��\�駯�\�\rcȽ�\�ݩ\�\��\�}�߯i�\�ATf\�\�ܚp�9�\�S.I�B��H%ui\�w֮B\�V-�^��\�h6��\��s\�U\��\�Ƥd \�_^\�\�\�4^\���tW:,./\�\Zk_�;�O\Z\�ۡ�\���\�8\�#b�\���\�v\�t\�\�km����\�	�:\�DGO}.={v�\�Oo\�:nC�\�AN|sK\�&�F\�,\"�d|K\�ؒPߜ\�?p\�\�\'�ނCwZ[)!\r\�Q%���[��Ѩ\�8�~P|?�g��\��\�^\"R�\�j\�\�1`0�h6\�X\\Z(�a�\�p�N�8h�\�\�48~%\�(��u\�ܲED7շM\��[�z�%\��K׾�fC�\�ձ��\'���tD�\���Ak6`��CsƐF������1#g\��x^\�s\�\�aU�\��G謭\�.\�1\'M�\�<��\�ΏG�\�\Z�n\�,.-�G\��\�:���\�\�Dcp\��\�M�Wg�\nGx!\�K0*Ϋ\��F��;8�ʵ�]�\r���s�\�{%,\�\�\�ð�\��\��ʁ��\�\�nk3ɰ�\�%U[~wuu�4Mi�\�#\�s]�\�\�kk�8-�\�\�c�\�\�\���\�\�y�z�\�\�\�\��<���@{��\rR\���owhL_:__���\�L�}~�>:�\�\�k^\�\rq{\��(<�h\�Q\�^�\\�\��\�hJ� q���\r�of�W����(\�v�,��\n\�R��$Ỉt�\�v9o̼0V�\�j�Z-����\�*@��I\�z���gz�\��bL0z\0��(\�\�:�b}�W��\�\��\ra\�\�\Z�[!T\�N�d��1E�j��8h�����\�y���\�-\�\�B\�juz\�^V�C�[�T \�y>����\�\�R\�r���Ŕ��7C\�8\Z\�x���Te���p�5aXmC\�Ǡ\�\�z�Zף�%���A�+\��\Z�^��\�JI\�\��`@�\��������1LLL�\�.l\�d�&\�ZD\�g�޾4���6Ć|�G%���)��.9f\�$9��\�\�\�K�v���ө\�\���=��ܓ�\�\�Y2u�\�\�T�6��R��q22.U�Fe���_~\�/;�7�\r�[�qt�!7\�b\�MF�r�\����z\�c\�\0\0\0\0IEND�B`�','Como las abuelas, pero con herramientas mas modernas.',100);
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
