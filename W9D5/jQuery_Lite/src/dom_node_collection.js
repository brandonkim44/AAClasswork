class DOMNodeCollection {
    constructor(array) {
        this.array = array;
    }

    html(string) {
        if (arguments.length === 0) {
            return this.array[0].innerHTML;
        } else {
            this.array.forEach( el => {
                el.innerHTML = string;
            });
            return this.array;
        }
    }

    empty() {
        this.array.forEach( el => {
            el.innerHTML = "";
        })
    }

    append(arg) { // DOMNodeCollection <-- generaet this first this.array[button] --> 2 buttons x 5 --> 10 buttons NODE 0,1this.array
        if (arg instanceof DOMNodeCollection) { //how many objs PER item inside this.array
            
            this.array.forEach( el1 => {
                arg.array.forEach( el2 => {
                    // debugger
                    let el2clone = el2.cloneNode(true); //an htmlelement is not equal to another just because they're the same
                    el1.append(el2clone);
                });
            }) 
        } 
        else {
            this.array.forEach( el => {
                el.append(arg);
            });
        }
    }

    attr(attrname, value) {
        if (arguments.length === 1) {
            console.log("this is working");
            // this.array.forEach( el => {
                for (let i = 0; i < this.array.length-1; i++) {
                    if (this.array[i].getAttribute(attrname) !== null) {
                        // console.log(this.array[i]);
                        return this.array[i];
                    }
                }
            // });
        } else if (arguments.length === 2) {
            // this.array.forEach(el => {
                for (let i = 0; i < this.array.length-1; i++) {
                    if (this.array[i].getAttribute(attrname) !== null) {
                        this.array[i].setAttribute(attrname, value);
                    }
                }
            // });
        }
    }
    
    addClass(classname) {

        this.array.forEach( el => {
            if (el.getAttribute("class") === null) {
                el.setAttribute("class", classname);
            } else if (el.getAttribute("class") === classname) {
                console.log("you're good");
            } else {
                const value = el.getAttribute("class");
                const newclassname = value + " " + classname;
                el.setAttribute("class", newclassname);
            }
        })
    }

    removeClass(classname) {
        this.array.forEach(el => {
            if (el.getAttribute("class") === null) {
                console.log("no classes fam");
            } else if (el.getAttribute("class").includes(classname)) {
                const value = el.getAttribute("class");
                const classNames = value.split(" ");
                // console.log(classNames);
                classNames.forEach( (el2, idx) => {
                    if (el2 === classname) {
                        // debugger;
                        //new scope inside of "if" so we can't use "el2"??????
                        // doesn't classNames[idx] === el2?
                        return classNames[idx] = ""; //we want to actually mutate the element itself
                    }
                });
                // console.log(classNames);
                el.setAttribute("class", classNames.join(" "));
            } 
            // else {
            //     const value = el.getAttribute("class");
            //     const newclassname = value + " " + classname;
            //     el.setAttribute("class", newclassname);
            // }
        })
    }
}

module.exports = DOMNodeCollection;