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

        var_dump($result);

        $rows = "";
        foreach ($result as $OverzichtExaminator) {
            $rows .= "<tr>
                        <td>$OverzichtExaminator->Voornaam</td>
                        <td>$OverzichtExaminator->Tussenvoegsel</td>
                        <td>$OverzichtExaminator->Achternaam</td>
                        <td>$OverzichtExaminator->Mobiel</td>
                        <td>$OverzichtExaminator->DatumInDienst</td>            
                        <td>$OverzichtExaminator->AantalSterren</td>            
                        <td>
                            <a href='" . URLROOT . "/instructeur/overzichtvoertuigen/$OverzichtExaminator->Id'>
                                <i class='bi bi-car-front'></i>
                            </a>
                        </td>            
                      </tr>";
        }

        $data = [
            'title' => 'Overzicht Afgenomen Examens Examinatoren',
            'rows' => $rows
        ];

        $this->view('Overzichtexaminator/OverzichtExaminator', $data);
    }
}
