public class contactController {
    @AuraEnabled(cacheable=true)
    public static List<contact> searchcontact(String searchTerm) {
        String searchQuery = '%' + searchTerm + '%';
        return [SELECT Id, FirstName, LastName FROM contact WHERE FirstName LIKE :searchQuery LIMIT 20];
    }
}