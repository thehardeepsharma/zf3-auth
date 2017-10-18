<?php

namespace Application;

use Zend\Db\Adapter\AdapterInterface;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ModuleManager\Feature\ConfigProviderInterface;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

use Zend\Authentication\Storage;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Adapter\DbTable as DbTableAuthAdapter;

class Module implements ConfigProviderInterface
{
    const VERSION = '3.0.2dev';

    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
	
	public function getServiceConfig()
    {
        return [
            'factories' => [
				\Application\Service\MyAuthStorage::class => function($sm) {
					return new \Application\Service\MyAuthStorage('user');  
				},
				'AuthService' => function($sm) {
					$dbAdapter           = $sm->get('Zend\Db\Adapter\Adapter');
					$dbTableAuthAdapter  = new DbTableAuthAdapter($dbAdapter, 'users','user_login','user_pass', 'MD5(?)');					 
					$authService = new AuthenticationService();
					$authService->setAdapter($dbTableAuthAdapter);
					$authService->setStorage($sm->get('Application\Service\MyAuthStorage'));					  
					return $authService;
				},
		
				/// User Table
				\Application\Model\UserTable::class =>  function($container) {
                    $tableGateway = $container->get(Model\UserTableGateway::class);
                    return new Model\UserTable($tableGateway);
                },
                Model\UserTableGateway::class => function($container) {
                    $dbAdapter = $container->get(AdapterInterface::class);
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Model\User());
                    return new TableGateway('users', $dbAdapter, null, $resultSetPrototype);
                },				
            ],
        ];
    }
	
    public function getControllerConfig()
    {
        return [
            'factories' => [
                Controller\IndexController::class =>  function($container) {
					return new Controller\IndexController($container);
                },
				Controller\AuthController::class =>  function($container) {
					return new Controller\AuthController($container);
                },
            ],
        ];
    }
	
	public function getViewHelperConfig()
    {
        return [
            'factories' => [],
        ];
    }
}
