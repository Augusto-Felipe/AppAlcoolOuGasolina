//
//  ViewController.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe Augusto Correia on 08/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoCalcular(_ sender: Any) {
        
        //Verificar se foi possível recuperar a informação
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
                //Validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if validaCampos {
                    //Cacular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                } else {
                    resultadoLegenda.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        //Converter valores textos para números
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar a Gasolina!"
                } else {
                    self.resultadoLegenda.text = "Melhor utilizar o Alcool!"
                }
            }
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var camposValidados = true
        var campoInvalido = ""
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
}

