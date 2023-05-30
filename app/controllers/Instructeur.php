<?php

class Instructeur extends BaseController
{
    private $instructeurModel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('InstructeurModel');
    }

    public function index()
    {
        $result = $this->instructeurModel->getInstructeurs();

        //var_dump($result);

        $rows = "";
        foreach ($result as $instructeur) {
            $rows .= "<tr>
                        <td>$instructeur->Voornaam</td>
                        <td>$instructeur->Tussenvoegsel</td>
                        <td>$instructeur->Achternaam</td>
                        <td>$instructeur->Mobiel</td>
                        <td>$instructeur->DatumInDienst</td>            
                        <td>$instructeur->AantalSterren</td>            
                        <td>
                            <a href='" . URLROOT . "/instructeur/overzichtvoertuigen/$instructeur->Id'>
                                <i class='bi bi-car-front'></i>
                            </a>
                        </td>            
                      </tr>";
        }

        $data = [
            'title' => 'Instructeurs in dienst',
            'rows' => $rows
        ];

        $this->view('Instructeur/overzichtinstructeur', $data);
    }

    public function overzichtVoertuigen($Id)
    {
        $result = $this->instructeurModel->getToegewezenVoertuigen($Id);

        $rows = "";
        foreach ($result as $instructeur) {
            $rows .= "<tr>

            <td>$instructeur->kenteken</td>
            <td>$instructeur->type</td>
            <td>$instructeur->bouwjaar</td>
            <td>$instructeur->brandstof</td>
            <td>$instructeur->typevoertuigid</td>            
            <td>$instructeur->rijbewijscategorie</td>              
            <td>
                <a href='" . URLROOT . "/instructeur/overzichttoevoegen/$instructeur->id'>
                    <i class='bi bi-plus'></i>
                </a>
            </td>            
        </tr>";
        }
        $data = [
            'title' => "Overzicht van alle voertuigen van " . $instructeur->id,
            'rows' => $rows
        ];

        $this->view('Instructeur/overzichtvoertuigen', $data);
    }

    public function overzichttoevoegen($Id)
    {
        $result = $this->instructeurModel->getToevoegendevoertuigen($Id);

        $rows = "";
        foreach ($result as $instructeur) {
            $rows .= "<tr>
            <td>$instructeur->kenteken</td>
            <td>$instructeur->type</td>
            <td>$instructeur->bouwjaar</td>
            <td>$instructeur->brandstof</td>
            <td>$instructeur->typevoertuigid</td>            
            <td>$instructeur->rijbewijscategorie</td>     
          <td>            <a href='" . URLROOT . "/instructeur/overzichttoevoegen/$instructeur->id'>
        <i class='bi bi-check'></i>
    </a>   </td>                  
        </tr>";
        }

        $data = [
            'title' => 'Overzicht van alle voertuigen die niet worden gebruikt:',
            'rows' => $rows
        ];

        $this->view('Instructeur/overzichttoevoegen', $data);
    }
}
