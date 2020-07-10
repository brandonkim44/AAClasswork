/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n    constructor(array) {\n        this.array = array;\n    }\n\n    html(string) {\n        if (arguments.length === 0) {\n            return this.array[0].innerHTML;\n        } else {\n            this.array.forEach( el => {\n                el.innerHTML = string;\n            });\n            return this.array;\n        }\n    }\n\n    empty() {\n        this.array.forEach( el => {\n            el.innerHTML = \"\";\n        })\n    }\n\n    append(arg) { // DOMNodeCollection <-- generaet this first this.array[button] --> 2 buttons x 5 --> 10 buttons NODE 0,1this.array\n        if (arg instanceof DOMNodeCollection) { //how many objs PER item inside this.array\n            \n            this.array.forEach( el1 => {\n                arg.array.forEach( el2 => {\n                    // debugger\n                    let el2clone = el2.cloneNode(true); //an htmlelement is not equal to another just because they're the same\n                    el1.append(el2clone);\n                });\n            }) \n        } \n        else {\n            this.array.forEach( el => {\n                el.append(arg);\n            });\n        }\n    }\n\n    attr(attrname, value) {\n        if (arguments.length === 1) {\n            console.log(\"this is working\");\n            // this.array.forEach( el => {\n                for (let i = 0; i < this.array.length-1; i++) {\n                    if (this.array[i].getAttribute(attrname) !== null) {\n                        // console.log(this.array[i]);\n                        return this.array[i];\n                    }\n                }\n            // });\n        } else if (arguments.length === 2) {\n            // this.array.forEach(el => {\n                for (let i = 0; i < this.array.length-1; i++) {\n                    if (this.array[i].getAttribute(attrname) !== null) {\n                        this.array[i].setAttribute(attrname, value);\n                    }\n                }\n            // });\n        }\n    }\n    \n    addClass(classname) {\n\n        this.array.forEach( el => {\n            if (el.getAttribute(\"class\") === null) {\n                el.setAttribute(\"class\", classname);\n            } else if (el.getAttribute(\"class\") === classname) {\n                console.log(\"you're good\");\n            } else {\n                const value = el.getAttribute(\"class\");\n                const newclassname = value + \" \" + classname;\n                el.setAttribute(\"class\", newclassname);\n            }\n        })\n    }\n\n    removeClass(classname) {\n        this.array.forEach(el => {\n            if (el.getAttribute(\"class\") === null) {\n                console.log(\"no classes fam\");\n            } else if (el.getAttribute(\"class\").includes(classname)) {\n                const value = el.getAttribute(\"class\");\n                const classNames = value.split(\" \");\n                // console.log(classNames);\n                classNames.forEach( (el2, idx) => {\n                    if (el2 === classname) {\n                        // debugger;\n                        //new scope inside of \"if\" so we can't use \"el2\"??????\n                        // doesn't classNames[idx] === el2?\n                        return classNames[idx] = \"\"; //we want to actually mutate the element itself\n                    }\n                });\n                // console.log(classNames);\n                el.setAttribute(\"class\", classNames.join(\" \"));\n            } \n            // else {\n            //     const value = el.getAttribute(\"class\");\n            //     const newclassname = value + \" \" + classname;\n            //     el.setAttribute(\"class\", newclassname);\n            // }\n        })\n    }\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nfunction $l(arg) {     \n    \n    if (typeof arg === \"string\") { //selector style for htmlelement //string literal is not an object\n        console.log(\"hello!\")\n        const nodeList = document.querySelectorAll(arg);\n        const nodeListArray = Array.from(nodeList);\n        return new DOMNodeCollection(nodeListArray);\n    } else if (arg instanceof HTMLElement) {\n        \n    }\n};\n\nwindow.$l = $l;\nwindow.domnodecollection = DOMNodeCollection;\n\n//1st arg = \".li\" \n//2nd arg = \"<li>\" //or if it doesn't exist on page\n//const variablename = document.getElementByID(\"somename\")\n// $l(variablename)\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });