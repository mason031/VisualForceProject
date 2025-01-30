import getAccounts from '@salesforce/apex/AccountHelper.getAccounts';
import { LightningElement,  wire } from 'lwc';
import {refreshApex} from '@salesforce/apex';
import OBJECT_API_NAME from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue'
export default class Challenge8 extends LightningElement {
    object_api_name = OBJECT_API_NAME;
    name = NAME_FIELD;
    annualrevenue = ANNUALREVENUE_FIELD;

    @wire(getAccounts)
    accList;

    /*
    handleDeletedAccount(){
        console.log('calling apex refresh');
        refreshApex(this.accList);
    }
        */

    refreshlist(){
        refreshApex(this.accList);
    }

}
