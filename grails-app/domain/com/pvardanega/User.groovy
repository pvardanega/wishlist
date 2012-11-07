package com.pvardanega

class User {

	transient springSecurityService

    String firstname
    String lastname
    String email
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
        firstname blank: false
        lastname blank: false
        email blank: false, unique: false, email: true
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    def isAdmin() {
        getAuthorities().contains(Role.findByAuthority("ROLE_ADMIN"))
    }
}
