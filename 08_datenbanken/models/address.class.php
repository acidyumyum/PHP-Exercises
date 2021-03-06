<?php

class Address extends BaseModel
{
    const TABLENAME = '`address`';

    protected $schema = [
        'id'          => [ 'type' => BaseModel::TYPE_INT ],
        'createdAt'   => [ 'type' => BaseModel::TYPE_STRING ],
        'updatedAt'   => [ 'type' => BaseModel::TYPE_STRING ],
        'zip'         => [ 'type' => BaseModel::TYPE_STRING, 'min' => 5, 'max' => 5],
        'city'        => [ 'type' => BaseModel::TYPE_STRING ],
        'street'      => [ 'type' => BaseModel::TYPE_STRING ],
        'number'      => [ 'type' => BaseModel::TYPE_STRING ]
    ];
}
?>