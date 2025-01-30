import { LightningElement , track} from 'lwc';

export default class Challenge3 extends LightningElement {
    @track
    items = ['Task1', 'Task2'];

    handleClick(){
        let input = this.refs.input.value;
        this.items.push(input);
    }
    
    removeItem(){
        console.log('Hello');
        console.log(e.target.dataset.itemindex);
        let newArr = items.slice(e.target.dataset.itemindex, e.target.dataset.itemindex+1);
        this.items = newArr;
    }
    
}