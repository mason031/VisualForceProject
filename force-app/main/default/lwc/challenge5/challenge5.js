import createCase from '@salesforce/apex/CaseHelper.createCase';
import { LightningElement } from 'lwc';

createCase
export default class Challenge5 extends LightningElement {

    handleClick(){
        console.log('handling case');
        let originParam = this.refs.inputorigin.value;
        let statusParam = this.refs.inputstatus.value;
        console.log(originParam);
        console.log(statusParam);
        createCase({origin:originParam, status:statusParam})
        .then((res) =>{
            this.dispatchEvent(new CustomEvent("createcase"));
        })
        .catch((e)=>{
            console.log(e);
        })
    }
}