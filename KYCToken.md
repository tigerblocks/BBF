 #![no_std]
// kyc-contract demo
use soroban_sdk::{
  contract, contractimpl, contractclient, Env, Symbol,  symbol_short, Address, String, log
};

const START_DATE: Symbol = symbol_short!("StartDate");
const END_DATE: Symbol = symbol_short!("EndDate");
const OWNER: Symbol = symbol_short!("Owner");
const REVOKE: Symbol = symbol_short!("Revoke");
   
#[contractclient(name = "Client")]
pub trait Contract {
  

  /*  fn set_owner(env: Env, owner: Address) {
        env.storage().instance().set(&OWNER, &owner);

    }

    fn set_dates(env: Env, start_date: String, end_date: String) {
        env.storage().instance().set(&START_DATE, &start_date);
        env.storage().instance().set(&END_DATE, &end_date);
    }

    fn set_start_date(env: Env, start_date: String) {
        env.storage().instance().set(&START_DATE, &start_date);

    }

   fn set_end_date(env: Env, end_date: String) {
        env.storage().instance().set(&END_DATE, &end_date);

    }   */


}

#[contract]
pub struct DateRangeContract;

#[contractimpl]
impl DateRangeContract {

  
    pub fn revokecontract(env: Env) { 
        let revoke = true;
        env.storage().instance().set(&REVOKE, &revoke);  
    }

    pub fn get_contract_state(env: Env) -> bool {          
         env.storage().instance().get(&REVOKE).unwrap_or(false)   
    } 
    
    pub fn get_start_date(env: Env) -> String {
        env.storage().instance().get(&START_DATE).unwrap()
    }   
         
    pub fn get_end_date(env: Env) -> String {
        env.storage().instance().get(&END_DATE).unwrap()
    }

    pub fn get_owner(env: Env) -> Address {
    env.storage().instance().get(&OWNER).unwrap()
    }

    pub fn  has_owner(env: Env) -> bool{
         env.storage().instance().has(&OWNER)
    }


    pub  fn set_owner(env: Env, owner: Address) {
        env.storage().instance().set(&OWNER, &owner);
    }
    
    pub  fn set_dates(env: Env, start_date: String, end_date: String) {
        env.storage().instance().set(&START_DATE, &start_date);
        env.storage().instance().set(&END_DATE, &end_date);
    }

    pub fn set_start_date(env: Env, start_date: String) {
        env.storage().instance().set(&START_DATE, &start_date);
    }

    pub fn set_end_date(env: Env, end_date: String) {
        env.storage().instance().set(&END_DATE, &end_date);
    }

}
