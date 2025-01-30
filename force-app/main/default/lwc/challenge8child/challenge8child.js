import deleteAccountWithId from '@salesforce/apex/AccountHelper.deleteAccountWithId';
import { api, LightningElement } from 'lwc';

export default class Challenge8child extends LightningElement {
    @api
    record;

    deleteAccount(e){
        let recordid = e.target.dataset.recordid;
        console.log(recordid);
        deleteAccountWithId({id: recordid}).then((res)=>{
            console.log('dispatching event');
            this.dispatchEvent(new CustomEvent('deletedaccount'));
        }).catch((e)=>{
            console.log(e);
        })
    }
}