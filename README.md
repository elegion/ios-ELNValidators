#Validators

Валидаторы для работы с формами

## Usage

Необходимо объявить класс формы, который наследуется от класса  `Form `. Инвалидные значения полей должны бросать `Error`, поэтому необходимо перечислить возможные ошибки.

```swift
import ELNValidators

// Declare form errors and localized description
enum OrderFormError: Error {
    
    case invalidFirstName
    case invalidLastName
	case invalidEmail
    
    var localizedDescription: String {
        switch self {
        case .invalidFirstName:
            return "Please enter your first name"
        case .invalidLastName:
            return "Please enter your last name"
        case .invalidEmail:
            return "Please enter valid email"
        }
    }
    
}

// Declare form
class OrderForm : Form {
    
    var firstName: String?
    
    var lastName: String?
    
    var email: String?
    
    // first name can not be empty
    func validateFirstName(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let _ = ioValue.pointee as? String else {
            throw OrderFormError.invalidFirstName
        }
    }
    
    // last name can not be empty
    func validateLastName(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let _ = ioValue.pointee as? String else {
            throw OrderFormError.invalidLastName
        }
    }
    
    // email can not be empty and should be valid
    func validateEmail(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let value = ioValue.pointee as? String else {
            throw OrderFormError.invalidEmail
        }
        
        do {
            try EmailValidator().validate(value)
        } catch {
            throw OrderFormError.invalidEmail
        }
    }

}
```

Класс `Form` имеет методы `validate()` и `errors`, Метод `validate()` бросает ошибку, если хотя бы одно из полей формы невалидно. Метод `errors` возвращает все существующие ошибки формы. 

Пример валидации:

```swift
// показать одну ошибку валидации
let form = OrderForm()
form.firstName = "first name"
form.lastName = "last name"
form.email = "invalidemail"
showErrors(form.errors) // show "Please enter valid email" message
```

## Installation

###Cocoapods

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/elegion/ios-podspecs'

pod 'ELNValidators' 
```

###Carthage

```
github 'elegion/ios-ELNValidators'
```

## Contribution

###Cocoapods

```sh
# download source code, fix bugs, implement new features

pod repo add legion https://github.com/elegion/ios-podspecs
pod repo push legion ELNValidators.podspec
```

