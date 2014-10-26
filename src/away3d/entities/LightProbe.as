package away3d.entities
{
	import away3d.arcane;
	import away3d.bounds.BoundingVolumeBase;
	import away3d.bounds.NullBounds;
    import away3d.core.base.LightBase;
    import away3d.core.partition.EntityNode;
	import away3d.core.partition.LightProbeNode;
	import away3d.core.render.IRenderer;
	import away3d.entities.Camera3D;
	import away3d.entities.IEntity;
	import away3d.textures.CubeTextureBase;
	
	import flash.geom.Matrix3D;
	
	use namespace arcane;
	
	public class LightProbe extends LightBase implements IEntity
	{
		private var _diffuseMap:CubeTextureBase;
		private var _specularMap:CubeTextureBase;
		
		/**
		 * Creates a new LightProbe object.
		 */
		public function LightProbe(diffuseMap:CubeTextureBase, specularMap:CubeTextureBase = null)
		{
			super();
			_isEntity = true;
			_diffuseMap = diffuseMap;
			_specularMap = specularMap;
		}
		
		override protected function createEntityPartitionNode():EntityNode
		{
			return new LightProbeNode(this);
		}
		
		public function get diffuseMap():CubeTextureBase
		{
			return _diffuseMap;
		}
		
		public function set diffuseMap(value:CubeTextureBase):void
		{
			_diffuseMap = value;
		}
		
		public function get specularMap():CubeTextureBase
		{
			return _specularMap;
		}
		
		public function set specularMap(value:CubeTextureBase):void
		{
			_specularMap = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function updateBounds():void
		{
			//			super.updateBounds();
			_boundsInvalid = false;
		}
		
		/**
		 * @inheritDoc
		 */
		protected function getDefaultBoundingVolume():BoundingVolumeBase
		{
			// todo: consider if this can be culled?
			return new NullBounds();
		}
		
		/**
		 * @inheritDoc
		 */
		override arcane function getObjectProjectionMatrix(entity:IEntity, camera:Camera3D, target:Matrix3D = null):Matrix3D
		{
			throw new Error("Object projection matrices are not supported for LightProbe objects!");
			return null;
		}

		public function collectRenderables(renderer:IRenderer):void
		{
			//nothing to do here
		}

		/**
		 * not supported for deferred
		 */
		override public function get deferred():Boolean {
			return false;
		}
	}
}