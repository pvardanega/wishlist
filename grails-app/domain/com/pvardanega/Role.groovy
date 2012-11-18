package com.pvardanega

class Role {

    public final static String ROLE_ADMIN = 'ROLE_ADMIN'
    public final static String ROLE_USER = 'ROLE_USER'

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
