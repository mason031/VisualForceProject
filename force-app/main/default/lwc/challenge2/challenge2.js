
import { LightningElement } from 'lwc';

export default class Challenge2 extends LightningElement {
    visible = true;

    handleClick(){
        this.visible = !this.visible;
    }

}