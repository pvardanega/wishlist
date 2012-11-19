import com.pvardanega.Role
import com.pvardanega.User
import com.pvardanega.UserRole

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                def adminRole = new Role(authority: Role.ROLE_ADMIN).save(flush: true)
                def userRole = new Role(authority: Role.ROLE_USER).save(flush: true)

                def adminUser = new User(username: 'admin', email: 'admin@yopmail.com',
                        firstname: 'firstname', lastname: 'lastname', enabled: true,
                        password: 'password')
                adminUser.save(flush: true)

                def user = new User(username: 'user', email: 'user@yopmail.com',
                        firstname: 'firstname', lastname: 'lastname', enabled: true,
                        password: 'password')
                user.save(flush: true)

                UserRole.create adminUser, adminRole, true
                UserRole.create user, userRole, true
            }
            production {
                def adminRole
                if (!Role.findByAuthority(Role.ROLE_ADMIN)) {
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
