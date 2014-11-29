package com.pvardanega

class UserAccount {

	transient springSecurityService

    String firstname
    String lastname
    String email
	String username
	String password
	String confirmation
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static transients = ['confirmation']

	static constraints = {
        firstname blank: false
        lastname blank: false
        email blank: false, unique: true, email: true
		username blank: false
		password blank: false
		confirmation blank: false
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

    String toString() {
        username
    }
}