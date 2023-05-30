<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT Id
                      ,Voornaam
                      ,Tussenvoegsel
                      ,Achternaam
                      ,Mobiel
                      ,DatumInDienst
                      ,AantalSterren
                FROM  Instructeur
                ORDER BY AantalSterren DESC";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getToegewezenVoertuigen($Id)
    {
        $sql = "SELECT v.id, v.kenteken, v.type, v.bouwjaar, v.brandstof, v.typevoertuigid, tv.id, tv.rijbewijscategorie
                FROM Voertuig v
                INNER JOIN Typevoertuig tv ON tv.id = v.typevoertuigid
                WHERE v.typevoertuigid = " . intval($Id) . ";";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getToevoegendevoertuigen($Id)
    {
        $sql = "SELECT v.id, v.kenteken, v.type, v.bouwjaar, v.brandstof, v.typevoertuigid, tv.id, tv.rijbewijscategorie
                FROM Voertuig v
                INNER JOIN Typevoertuig tv ON tv.id = v.typevoertuigid
                WHERE v.typevoertuigid = 5";

        $this->db->query($sql);
        return $this->db->resultSet();
    }
}
