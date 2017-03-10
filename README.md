<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#org66639a2">1. Description</a></li>
<li><a href="#orgcaeac2a">2. Technologies used</a></li>
<li><a href="#org5e1e65d">3. Setup/Installation</a></li>
<li><a href="#orgcf0b0cc">4. License</a></li>
</ul>
</div>
</div>

<a id="org66639a2"></a>

# Description

This application provide an easy way to keep your spending history. You can
organize them by categories and view a pretty charts with useful stats.


<a id="orgcaeac2a"></a>

# Technologies used

-   Ruby on Rails 5.0.1
-   Ruby 2.3.3
-   Postgres
-   Chartkick
-   Datagrid


<a id="org5e1e65d"></a>

# Setup/Installation

Git clone this repository and create config/database.yml file, set them to
pgsql. [More
here](<http://guides.rubyonrails.org/configuring.html#configuring-a-database>)

    $ bundle install
    $ rails db:create
    $ rails db:migrate
    $ rails db:test:prepare
    $ rails s


<a id="orgcf0b0cc"></a>

# License

The app under the terms of the [MIT License](https://github.com/vmikhaliuk/bookkeeper/blob/master/LICENSE).
