// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()



// rails6.0 で　"$ is not defined" が出る場合
// https://qiita.com/___xxx_/items/23f3c6939526fffa5d82
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import "@fortawesome/fontawesome-free/js/all";

import "../css/application.css";
import "../css/application.scss";
import '../javascripts/application.js';

// webpackerを使ってjs,scssを適用
// https://qiita.com/kazutosato/items/d47b7705ee545de4cb1a