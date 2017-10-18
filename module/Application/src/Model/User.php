<?php

namespace Application\Model;

use DomainException;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class User implements InputFilterAwareInterface
{
    public $id;
    public $user_login;
    public $user_pass;
    public $user_role;
    public $user_nickname;
    public $user_status;
    public $registred_date;
	
	private $inputFilter;

    public function exchangeArray(array $data)
    {
        $this->id     = ! empty($data['id']) ? $data['id'] : 0;
        $this->user_login = ! empty($data['user_login']) ? $data['user_login'] : null;
        $this->user_pass = ! empty($data['user_pass']) ? $data['user_pass'] : null;
        $this->user_role  = ! empty($data['user_role']) ? $data['user_role'] : null;
        $this->user_nickname  = ! empty($data['user_nickname']) ? $data['user_nickname'] : null;
        $this->user_status  = ! empty($data['user_status']) ? $data['user_status'] : null;
        $this->registred_date  = ! empty($data['registred_date']) ? $data['registred_date'] : date('Y-m-d H:i:s');
    }
	
	public function getArrayCopy()
    {
        return [
            'id'     			=> $this->id,
            'user_login' 		=> $this->user_login,
            'user_pass'  		=> $this->user_pass,
            'user_role'  		=> $this->user_role,
            'user_nickname'  	=> $this->user_nickname,
            'user_status'  		=> $this->user_status,
            'registred_date'  	=> $this->registred_date,
        ];
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new DomainException(sprintf(
            '%s does not allow injection of an alternate input filter',
            __CLASS__
        ));
    }

    public function getInputFilter()
    {
        if ($this->inputFilter) {
            return $this->inputFilter;
        }
		
		$isEmpty = \Zend\Validator\NotEmpty::IS_EMPTY;

        $inputFilter = new InputFilter();
		
		$inputFilter->add([
            'name' => 'user_login',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 2,
                        'max' => 100,
                    ],
                ],
            ],
        ]);
		
		$inputFilter->add([
            'name' => 'user_pass',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'NotEmpty',
                    'options' => [
                        'messages' => [
							$isEmpty => 'Usre pass can not be empty.',
						],
                    ],
                ],
            ],
        ]);
		
		$inputFilter->add([
            'name' => 'user_role',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 3,
                        'max' => 20,
                    ],
                ],
            ],
        ]);
		
		$inputFilter->add([
            'name' => 'user_nickname',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'StringTrim'],
            ],
            'validators' => [
                [
                    'name' => 'StringLength',
                    'options' => [
                        'encoding' => 'UTF-8',
                        'min' => 2,
                        'max' => 100,
                    ],
                ],
            ],
        ]);

        $this->inputFilter = $inputFilter;
        return $this->inputFilter;
    }
	
}