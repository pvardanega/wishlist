import com.pvardanega.Role
import com.pvardanega.User
import com.pvardanega.UserRole

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                def adminRole = new Role(authority: Role.ROLE_ADMIN).save(flush: true)
                def userRole = new Role(authority: Role.ROLE_USER).save(flush: true)

                def pj = new User(username: 'Pierre-Jean V.', email: 'pj@yopmail.com', firstname: 'Pierre-Jean',
                        lastname: 'Vardanega', enabled: true, password: 'password').save(flush: true)

                def amira = new User(username: 'Amira L.', email: 'amira@yopmail.com', firstname: 'Amira',
                        lastname: 'Lakhal', enabled: true, password: 'password').save(flush: true)

                def baptiste = new User(username: 'Baptiste V.', email: 'baptiste@yopmail.com', firstname: 'Baptiste',
                        lastname: 'Vardanega', enabled: true, password: 'password').save(flush: true)

                UserRole.create pj, adminRole, true
                UserRole.create amira, userRole, true
                UserRole.create baptiste, userRole, true
            }
            production {
                def adminRole = Role.findByAuthority(Role.ROLE_ADMIN)
                if (!adminRole) {
                    adminRole = new Role(authority: Role.ROLE_ADMIN).save(flush: true)
                }
                if (!Role.findByAuthority(Role.ROLE_USER)) {
                    new Role(authority: Role.ROLE_USER).save(flush: true)
                }
                if (!UserRole.findByRole(adminRole)) {
                    def adminUser = new User(username: 'admin', email: 'admin@yopmail.com',
                            firstname: 'firstname', lastname: 'lastname', enabled: true,
                            password: 'password')
                    adminUser.save(flush: true)
                    UserRole.create adminUser, adminRole, true
                }
            }
        }
    }
    def destroy = {
    }
}
