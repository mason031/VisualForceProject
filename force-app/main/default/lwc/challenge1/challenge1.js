import { LightningElement } from 'lwc';

export default class Challenge1 extends LightningElement {

    greeting = 'hello world';

    handleClick(){
        let input = this.refs.input.value;
        this.greeting = input;
    }
    
}