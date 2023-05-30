<?php

class OverzichtExaminator extends BaseController
{
    private $OverzichtExaminator;

    public function __construct()
    {
        $this->OverzichtExaminator = $this->model('OverzichtExaminatorModel');
    }

    public function index()
    {
        $result = $this->OverzichtExaminator->getOverzichtExaminator();

        //var_dump($result);

        $rows = "";
        foreach ($result as $OverzichtExaminator) {
            $rows .= "<tr>
                        <td>$OverzichtExaminator->Voornaam</td>
                        <td>$OverzichtExaminator->Datum</td>
                        <td>$OverzichtExaminator->Rijbewijscategorie</td>
                        <td>$OverzichtExaminator->Rijschool</td>
                        <td>$OverzichtExaminator->Stad</td>            
                        <td>$OverzichtExaminator->Uitslag</td>                       
                      </tr>";
        }

        $data = [
            'title' => 'Overzicht Afgenomen Examens Examinatoren',
            'rows' => $rows
        ];

        $this->view('Overzichtexaminator/OverzichtExaminator', $data);
    }
}
