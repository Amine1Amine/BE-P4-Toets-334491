<?php

class OverzichtExaminatorModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getOverzichtExaminator()
    {
        $sql = "SELECT Examinator.Voornaam, Examen.Datum, Examen.Rijbewijscategorie, Examen.Rijschool, Examen.Stad, Examen.Uitslag
        FROM Examen
        INNER JOIN ExamenPerExaminator ON Examen.Id = ExamenPerExaminator.ExamenId
        INNER JOIN Examinator ON ExamenPerExaminator.ExaminatorId = Examinator.Id
        ORDER BY Examen.Id DESC;";

        $this->db->query($sql);
        return $this->db->resultSet();
    }
}
