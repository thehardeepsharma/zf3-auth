<?php
namespace Application\Form;

use Zend\Form\Form;

class LoginForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('form-login');
		
		$this->setUseInputFilterDefaults(false);

        $this->add([
            'name' => 'id',
            'type' => 'hidden',
        ]);
		$this->add([
            'name' => 'user_login',
            'type' => 'text',
            'options' => [
                'label' => 'User Login',
            ],
			'attributes' => [
				'class'			=> 'form-control',
				'placeholder'	=> 'Your Username',
			]
        ]);
        $this->add([
            'name' => 'user_pass',
            'type' => 'password',
            'options' => [
                'label' => 'Password',
            ],
			'attributes' => [
                'class'			=> 'form-control',
				'placeholder'	=> 'Your Password',
            ],
        ]);		
        $this->add([
            'name' => 'login',
            'type' => 'submit',
            'attributes' => [
                'value' => 'Login Now',
                'id'    => 'submit',
				'class'	=> 'btn btn-primary'
            ],
        ]);
    }
	
}