<?php
namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Application\Model\User;
use Application\Model\UserTable;
use Application\Form\LoginForm;
use Application\Form\Filter\LoginFilter;
use Application\Service\MyAuthStorage;

class AuthController extends AbstractActionController
{
	protected $userTable;	
    protected $storage;
    protected $authservice;
     
    public function __construct($container)
    {
		$this->userTable = $container->get(\Application\Model\UserTable::class);
		$this->storage = $container->get(\Application\Service\MyAuthStorage::class);
		$this->authService = $container->get('AuthService');
    }
	
	function getAuthService() 
	{
		return $this->authService;
	}
	
	function getSessionStorage()
    {
	    return $this->storage;
    }
	
	public function loginAction()
    {
		$form = new LoginForm();
		$request = $this->getRequest();
        if ($request->isPost()){
			$form->setInputFilter(new LoginFilter());			
			$form->setData($request->getPost());
			if ($form->isValid()) {
                $this->getAuthService()
						->getAdapter()
					    ->setIdentity($request->getPost('user_login'))
					    ->setCredential($request->getPost('user_pass'));
                                        
                $result = $this->getAuthService()->authenticate();
				$messages = $result->getMessages();
                if ($result->isValid()) {
					if ($request->getPost('rememberme') == 1) {
						$this->getSessionStorage()->setRememberMe(1);
                        $this->getAuthService()->setStorage($this->getSessionStorage());
                    }
					$user_login = $request->getPost('user_login');
					$userinfo = [
						'username' => $user_login,		
					];
					$userinfo = (object) $userinfo;
					$this->getAuthService()->getStorage()->write($userinfo);
					return $this->redirect()->toRoute('home');
                }
            }
        }
				
		return new ViewModel([
			'form' => $form
		]);
    }
	
	public function logoutAction()
    {
        $this->getSessionStorage()->forgetMe();
        $this->getAuthService()->clearIdentity();         
        return $this->redirect()->toRoute('login');
    }
}