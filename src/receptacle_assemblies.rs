use async_graphql::{Object, ID};
use uuid::Uuid;

#[derive(Debug, sqlx::FromRow)]
pub struct ReceptacleAssembly {
    pub receptacle_assembly_id: Uuid,
    pub assembly_id: Uuid,
    pub installation: String,
    pub box_type: String,
    pub amps: i32,
    pub wall_plate: String,
    pub conductor_length: i32,
    pub is_home_run: bool,
    pub protection: Option<String>,
    pub panel_type: Option<String>,
}

#[Object]
impl ReceptacleAssembly {
    async fn id(&self) -> ID {
        self.receptacle_assembly_id.into()
    }
}
