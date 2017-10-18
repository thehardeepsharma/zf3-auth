Zend 3 Enable Development Mode

Run Command:   php composer.phar development-enable

Zend 3 Disable Development Mode

Run Command:   php composer.phar development-disable


Add Custom Module in "composer.json" file in "autoload" section

Run Command:   php composer.phar dump-autoload

Add Module in 'config/modules.config.php' file


Theme Link:  http://binarytheme.com/responsive-advance-admin-template/
http://www.cssauthor.com/bootstrap-admin-templates/

https://github.com/mongodb/mongo-php-driver/issues/195#issuecomment-169405194


Enable Development Mode:
php composer.phar development-enable

Disable Development Mode:
php composer.phar development-disable

Autoload Module:
php composer.phar dump-autoload



https://docs.mongodb.com/manual/reference/command/group/
https://docs.mongodb.com/manual/reference/command/aggregate/

http://php.net/manual/en/class.mongodb-driver-command.php

Distinct Record

$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");

$query = ['prodCat' => '10 oz can']; // your typical MongoDB query
$cmd = new MongoDB\Driver\Command([
    // build the 'distinct' command
    'distinct' => 'product', // specify the collection name
    'key' => 'scent', // specify the field for which we want to get the distinct values
    'query' => $query // criteria to filter documents
]);
$cursor = $manager->executeCommand('catalog', $cmd); // retrieve the results
$scents = current($cursor->toArray())->values; // get the distinct values as an array



Group By Example

$command = new \MongoDB\Driver\Command([
	'group' => [
		'ns' => 'users', // tablename
		'$reduce' => new \MongoDB\BSON\JavaScript('function(doc, prev){ prev.count += 1}'),
		'key' => [ 'status' => true ],
		'initial' => [ 'count' => 0 ],
	],
]);

$cursor = $mongodb->executeCommand($dbname, $command);
$result = $cursor->toArray()[0];
echo '<pre>'; print_r($result); echo '</pre>';






$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");


#Group 
http://php.net/manual/en/mongodb-driver-manager.executecommand.php


$command = new MongoDB\Driver\Command([
    'aggregate' => 'collection',
    'pipeline' => [
        ['$group' => ['_id' => '$y', 'sum' => ['$sum' => '$x']]],
    ],
    'cursor' => new stdClass,
]);
$cursor = $manager->executeCommand('db', $command);


Filter
http://php.net/manual/en/mongodb-driver-manager.executequery.php
http://php.net/manual/en/class.mongodb-driver-query.php

$filter = ['x' => ['$gt' => 1]];
$options = [
    'projection' => ['_id' => 0],
    'sort' => ['x' => -1],
];

$query = new MongoDB\Driver\Query($filter, $options);
$cursor = $manager->executeQuery('db.collection', $query);

for delete, update, insert -> 
https://mongodb.github.io/mongo-php-driver/bulk/
