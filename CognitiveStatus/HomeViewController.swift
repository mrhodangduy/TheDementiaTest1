//
//  ViewController.swift
//  CognitiveStatus
//
//  Created by QTS Coder on 8/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

let standard = UserDefaults.standard

class HomeViewController: UIViewController {
    
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var sw_PersonAlert: UISwitch!
    @IBOutlet weak var txt_DateOfBirth: UITextField!
    @IBOutlet weak var txt_Education: UITextField!
    @IBOutlet weak var sw_Sex: UISwitch!
    @IBOutlet weak var txt_Ethnicity: UITextField!
    @IBOutlet weak var txt_Age: UITextField!
    @IBOutlet weak var txt_Work: UITextField!
    @IBOutlet weak var lbl_Sex: UILabel!
    @IBOutlet var rightNavi: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    
    let datePicker = UIDatePicker()
    let educationPickerView = UIPickerView()
    let ethnicityPickerView = UIPickerView()
    let workPickerView = UIPickerView()
    
    
    
    let Education = ["Less than High School", "High School", "Some College and Technical", "College Degree","Profestional Degree"]
    let Ethnicity = ["Black","White","Hispanic","Asian/parafic Islander", "Native American","Other"]
    
    let Work = ["Profession/Technical","Management","Clerical","Sales","Skilled", "Semi-Skilled","UnSkilled"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "EXAMINATION"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.rightNavi)
        
        
        configPickerView()
        configTextFiled()
        
        showDatePicker()
        
        lbl_Sex.text = "Female"
        setImageforTextFiled(textfiled: txt_DateOfBirth)
        setImageforTextFiled(textfiled: txt_Education)
        setImageforTextFiled(textfiled: txt_Ethnicity)
        setImageforTextFiled(textfiled: txt_Work)
        
    }
    
    func saveUserData()
    {
        standard.set(txt_Name.text, forKey: "name")
        standard.set(txt_DateOfBirth.text, forKey: "dateOfBirth")
        standard.set(txt_Ethnicity.text, forKey: "ethinicity")
        standard.set(txt_Education.text, forKey: "education")
        standard.set(Int(txt_Age.text!), forKey: "age")
        standard.set(txt_Work.text, forKey: "work")
        standard.set(sw_PersonAlert.isOn, forKey: "personAlert")
        standard.set(sw_Sex.isOn, forKey: "sex")
    }
    
    func setImageforTextFiled(textfiled: UITextField)
    {
        textfiled.rightViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 20))
        let image = #imageLiteral(resourceName: "ic_down")
        imageView.image = image
        textfiled.rightView = imageView
    }
    
    @IBAction func Next(_ sender: Any) {
        if checkValidated()
        {
            saveUserData()
            let OrientationVC = storyboard?.instantiateViewController(withIdentifier: "Orientation") as! OrientationViewController
            self.navigationController?.pushViewController(OrientationVC, animated: true)
            
        }
        else
        {
            displayAlert(title: "Warning", mess: "Missing some infomation")
        }
    }
    
    @IBAction func setDateOfBirth(_ sender: UITextField) {
        
        if standard.object(forKey: "dateOfBirth") == nil
        {
            let date = Date()
            let format = DateFormatter()
            format.dateStyle = .medium
            txt_DateOfBirth.text = "\(format.string(from: date))"
        }
            
        else
        {
            txt_DateOfBirth.text = standard.object(forKey: "dateOfBirth") as? String
        }
        
    }
    @IBAction func EducationTF(_ sender: UITextField) {
        if standard.object(forKey: "education") == nil
        {
            txt_Education.text = Education[0]
        }
        else
        {
            txt_Education.text = standard.object(forKey: "education") as? String
        }
    }
    
    @IBAction func EthnicityTF(_ sender: UITextField) {
        
        if standard.object(forKey: "ethinicity") == nil
        {
            txt_Ethnicity.text = Ethnicity[0]
        }
        else
        {
            txt_Ethnicity.text = standard.object(forKey: "ethinicity") as? String
        }
    }
    @IBAction func WorkTF(_ sender: UITextField) {
        if standard.object(forKey: "work") == nil
        {
            txt_Work.text = Work[0]
        }
        else
        {
            txt_Work.text = standard.object(forKey: "work") as? String
        }

    }
    
    @IBAction func sw_Sex(_ sender: UISwitch) {
        if sender.isOn
        {
            lbl_Sex.text = "Male"
        }
        else
        {
            lbl_Sex.text = "Female"
        }
        
    }
    
    
    func checkValidated() -> Bool
    {
        if txt_Name.text?.characters.count == 0 || txt_DateOfBirth.text?.characters.count == 0 || txt_Education.text?.characters.count == 0 || txt_Ethnicity.text?.characters.count == 0 || txt_Age.text?.characters.count == 0 || txt_Work.text?.characters.count == 0
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    
    func configTextFiled()
    {
        txt_Name.adjustsFontSizeToFitWidth = true
        txt_DateOfBirth.adjustsFontSizeToFitWidth = true
        txt_Age.adjustsFontSizeToFitWidth = true
        txt_Work.adjustsFontSizeToFitWidth = true
        txt_Education.adjustsFontSizeToFitWidth = true
        txt_Ethnicity.adjustsFontSizeToFitWidth = true
        
        txt_Age.delegate = self
//        txt_Ethnicity.delegate = self
//        txt_Work.delegate = self
        
        txt_DateOfBirth.tintColor = UIColor.clear
        txt_Ethnicity.tintColor = UIColor.clear
        txt_Work.tintColor = UIColor.clear
        
    }
    
    func configPickerView()
    {
        educationPickerView.tag = 0
        ethnicityPickerView.tag = 1
        workPickerView.tag = 2
        
        educationPickerView.delegate = self
        ethnicityPickerView.delegate = self
        workPickerView.delegate = self
        
        self.txt_Education.inputView = self.educationPickerView
        self.txt_Ethnicity.inputView = self.ethnicityPickerView
        self.txt_Work.inputView = self.workPickerView
        
        let toolbar = setToolBarPicker()
        self.txt_Education.inputAccessoryView = toolbar
        self.txt_Ethnicity.inputAccessoryView = toolbar
        self.txt_Work.inputAccessoryView = toolbar
        
    }
    
    func setToolBarPicker() -> UIToolbar
    {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor.black
        toolbar.tintColor = UIColor.white
        toolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.DonePickerView))
        toolbar.setItems([spaceButton,spaceButton,doneButton], animated: false)
        
        return toolbar
    }
    
    
    func setToolBarDate() -> UIToolbar
    {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor.black
        toolbar.tintColor = UIColor.white
        toolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.donedatePicker))
        toolbar.setItems([spaceButton,spaceButton,doneButton], animated: false)
        
        return toolbar
    }
    
    func showDatePicker()
    {
        datePicker.datePickerMode = .date
        
        //Toolbar
        
        let toolbar = setToolBarDate()
        
        txt_DateOfBirth.inputAccessoryView = toolbar
        txt_DateOfBirth.inputView = datePicker
        
    }
    
    func DonePickerView()
    {
        self.view.endEditing(true)
    }
    
    func donedatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        txt_DateOfBirth.text = "\(formatter.string(from: datePicker.date))"
        standard.set(txt_DateOfBirth.text, forKey: "birthday")
        
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func displayAlert(title: String, mess: String)
    {
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        let btn = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
        
        alert.addAction(btn)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0
        {
            return Education.count
        } else if pickerView.tag == 1
        {
            return Ethnicity.count
        } else if pickerView.tag == 2
        {
            return Work.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let dataSource = pickerView.tag
        
        switch dataSource {
        case 0:
            return Education[row]
        case 1:
            return Ethnicity[row]
        case 2:
            return Work[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let dataSource = pickerView.tag
        
        if dataSource == 0
        {
            txt_Education.text = "\(Education[row])"
        }
        else if dataSource == 1
        {
            txt_Ethnicity.text = "\(Ethnicity[row])"
        }
        else if dataSource == 2
        {
            txt_Work.text = "\(Work[row])"
        }
        
    }
    
}

extension HomeViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        moveTextField(textField, moveDistance: -120, up: true)

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        moveTextField(textField, moveDistance: -120, up: false)

    }
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}














