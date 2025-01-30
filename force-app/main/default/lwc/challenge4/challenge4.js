import { LightningElement, track, wire } from 'lwc';
import getHighPriorityCases from '@salesforce/apex/CaseHelper.getHighPriorityCases';
import {refreshApex} from '@salesforce/apex';
export default class Challenge4 extends LightningElement {

    @wire(getHighPriorityCases)
    caseList;

    columns = [
        {label: 'Status', fieldName:'Status', type:'picklist'}
    ]

    handleChildEvent(){
        refreshApex(this.caseList)
    }
}