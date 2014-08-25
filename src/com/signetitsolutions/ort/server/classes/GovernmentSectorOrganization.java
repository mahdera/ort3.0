/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author TOSHIBA
 * 
 */
public class GovernmentSectorOrganization {
	private int id;
	private String organizationName;
	private String description;
	private int sectorCategoryId;
	private String officePhone;
	private String fax;
	private int regionId;
	private int zoneId;
	private int woredaId;
	private int kebeleId;
	private int modifiedBy;
	private Date modificationDate;
	
	

	/**
	 * 
	 */
	public GovernmentSectorOrganization() {
	}
	
	

	/**
	 * @param organizationName
	 * @param description
	 * @param sectorCategoryId
	 * @param officePhone
	 * @param fax
	 * @param regionId
	 * @param zoneId
	 * @param woredaId
	 * @param kebeleId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public GovernmentSectorOrganization(String organizationName,
			String description, int sectorCategoryId, String officePhone,
			String fax, int regionId, int zoneId, int woredaId, int kebeleId,
			int modifiedBy, Date modificationDate) {
		this.organizationName = organizationName;
		this.description = description;
		this.sectorCategoryId = sectorCategoryId;
		this.officePhone = officePhone;
		this.fax = fax;
		this.regionId = regionId;
		this.zoneId = zoneId;
		this.woredaId = woredaId;
		this.kebeleId = kebeleId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}


	
	

	/**
	 * @param id
	 * @param organizationName
	 * @param description
	 * @param sectorCategoryId
	 * @param officePhone
	 * @param fax
	 * @param regionId
	 * @param zoneId
	 * @param woredaId
	 * @param kebeleId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public GovernmentSectorOrganization(int id, String organizationName,
			String description, int sectorCategoryId, String officePhone,
			String fax, int regionId, int zoneId, int woredaId, int kebeleId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.organizationName = organizationName;
		this.description = description;
		this.sectorCategoryId = sectorCategoryId;
		this.officePhone = officePhone;
		this.fax = fax;
		this.regionId = regionId;
		this.zoneId = zoneId;
		this.woredaId = woredaId;
		this.kebeleId = kebeleId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}



	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the organizationName
	 */
	public String getOrganizationName() {
		return organizationName;
	}

	/**
	 * @param organizationName
	 *            the organizationName to set
	 */
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the sectorCategoryId
	 */
	public int getSectorCategoryId() {
		return sectorCategoryId;
	}

	/**
	 * @param sectorCategoryId
	 *            the sectorCategoryId to set
	 */
	public void setSectorCategoryId(int sectorCategoryId) {
		this.sectorCategoryId = sectorCategoryId;
	}

	/**
	 * @return the officePhone
	 */
	public String getOfficePhone() {
		return officePhone;
	}

	/**
	 * @param officePhone
	 *            the officePhone to set
	 */
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax;
	}

	/**
	 * @param fax
	 *            the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}

	/**
	 * @return the regionId
	 */
	public int getRegionId() {
		return regionId;
	}

	/**
	 * @param regionId
	 *            the regionId to set
	 */
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	/**
	 * @return the zoneId
	 */
	public int getZoneId() {
		return zoneId;
	}

	/**
	 * @param zoneId
	 *            the zoneId to set
	 */
	public void setZoneId(int zoneId) {
		this.zoneId = zoneId;
	}

	/**
	 * @return the woredaId
	 */
	public int getWoredaId() {
		return woredaId;
	}

	/**
	 * @param woredaId
	 *            the woredaId to set
	 */
	public void setWoredaId(int woredaId) {
		this.woredaId = woredaId;
	}

	/**
	 * @return the kebeleId
	 */
	public int getKebeleId() {
		return kebeleId;
	}

	/**
	 * @param kebeleId
	 *            the kebeleId to set
	 */
	public void setKebeleId(int kebeleId) {
		this.kebeleId = kebeleId;
	}
	
	

	/**
	 * @return the modifiedBy
	 */
	public int getModifiedBy() {
		return modifiedBy;
	}



	/**
	 * @param modifiedBy the modifiedBy to set
	 */
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}



	/**
	 * @return the modificationDate
	 */
	public Date getModificationDate() {
		return modificationDate;
	}



	/**
	 * @param modificationDate the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}



	public void save() {
		try {
			String sqlStr = "insert into tbl_government_sector_organization values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getOrganizationName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getSectorCategoryId());
			pStmt.setString(5, this.getOfficePhone());
			pStmt.setString(6, this.getFax());
			pStmt.setInt(7, this.getRegionId());
			pStmt.setInt(8, this.getZoneId());
			pStmt.setInt(9, this.getWoredaId());
			pStmt.setInt(10, this.getKebeleId());
			pStmt.setInt(11, this.getModifiedBy());
			pStmt.setDate(12, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(GovernmentSectorOrganization governmentSectorOrganization) {
		try {
			String sqlStr = "update tbl_government_sector_organization set organization_name = ?,"+
					"description = ?, sector_category_id = ?, office_phone = ?, fax= ?, region_id = ?,"+
					"zone_id = ?, woreda_id = ?, kebele_id = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, governmentSectorOrganization.getOrganizationName());
			pStmt.setString(2, governmentSectorOrganization.getDescription());
			pStmt.setInt(3, governmentSectorOrganization.getSectorCategoryId());
			pStmt.setString(4, governmentSectorOrganization.getOfficePhone());
			pStmt.setString(5, governmentSectorOrganization.getFax());
			pStmt.setInt(6, governmentSectorOrganization.getRegionId());
			pStmt.setInt(7, governmentSectorOrganization.getZoneId());
			pStmt.setInt(8, governmentSectorOrganization.getWoredaId());
			pStmt.setInt(9, governmentSectorOrganization.getKebeleId());
			pStmt.setInt(10, governmentSectorOrganization.getModifiedBy());
			pStmt.setDate(11, governmentSectorOrganization.getModificationDate());
			pStmt.setInt(12, governmentSectorOrganization.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_government_sector_organization where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<GovernmentSectorOrganization> getAllGovernmentSectorOrganizations() {
		List<GovernmentSectorOrganization> list = new ArrayList<GovernmentSectorOrganization>();
		GovernmentSectorOrganization governmentSectorOrganization = null;
		try {
			String query = "select * from tbl_government_sector_organization order by organization_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				governmentSectorOrganization = new GovernmentSectorOrganization(
						rSet.getInt("id"), rSet.getString("organization_name"),
						rSet.getString("description"),
						rSet.getInt("sector_category_id"),
						rSet.getString("office_phone"), rSet.getString("fax"),
						rSet.getInt("region_id"), rSet.getInt("zone_id"),
						rSet.getInt("woreda_id"), rSet.getInt("kebele_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(governmentSectorOrganization);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<GovernmentSectorOrganization> getAllGovernmentSectorOrganizationsLocatedInThisTerritory(
			String territoryColumn, int idValue) {
		List<GovernmentSectorOrganization> list = new ArrayList<GovernmentSectorOrganization>();
		GovernmentSectorOrganization governmentSectorOrganization = null;
		try {
			String query = "select * from tbl_government_sector_organization where "
					+ territoryColumn
					+ " = "
					+ idValue
					+ " order by organization_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				governmentSectorOrganization = new GovernmentSectorOrganization(
						rSet.getInt("id"), rSet.getString("organization_name"),
						rSet.getString("description"),
						rSet.getInt("sector_category_id"),
						rSet.getString("office_phone"), rSet.getString("fax"),
						rSet.getInt("region_id"), rSet.getInt("zone_id"),
						rSet.getInt("woreda_id"), rSet.getInt("kebele_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(governmentSectorOrganization);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static GovernmentSectorOrganization getGovernmentSectorOrganization(
			int id) {
		GovernmentSectorOrganization governmentSectorOrganization = null;
		try {
			String query = "select * from tbl_government_sector_organization where id = "
					+ id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				governmentSectorOrganization = new GovernmentSectorOrganization(
						rSet.getInt("id"), rSet.getString("organization_name"),
						rSet.getString("description"),
						rSet.getInt("sector_category_id"),
						rSet.getString("office_phone"), rSet.getString("fax"),
						rSet.getInt("region_id"), rSet.getInt("zone_id"),
						rSet.getInt("woreda_id"), rSet.getInt("kebele_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return governmentSectorOrganization;
	}
}// end class
