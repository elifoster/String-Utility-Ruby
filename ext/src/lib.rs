#[macro_use]
extern crate ruru;

use ruru::{AnyObject, Class, RString, VM};
use ruru::types::{Argc, Value};
use ruru::traits::Object;

class!(StringUtility);

methods!(
    RString,
    itself,
    
    fn underscorify() -> RString {
        RString::new(&str::replace(&itself.to_string(), " ", "_"))
    }
    
    fn spacify() -> RString {
        RString::new(&str::replace(&itself.to_string(), "_", " "))
    }
);

#[no_mangle]
pub extern fn initialize_me() {
    Class::from_existing("String").define(|itself| {
        itself.def("underscorify", underscorify);
        itself.def("spacify", spacify);
    });
}